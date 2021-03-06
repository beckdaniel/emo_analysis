from sklearn.linear_model import Ridge, RidgeCV
from sklearn.kernel_ridge import KernelRidge
from sklearn.metrics import mean_absolute_error as MAE
from sklearn.metrics import mean_squared_error as MSE
from sklearn.preprocessing import scale
from scipy.stats.stats import pearsonr
import sys
import util
import numpy as np
import GPy
import flakes

INPUTS = sys.argv[1]
LABELS = sys.argv[2]
EMBS = sys.argv[3]
SPLIT = int(sys.argv[4])
TEST_SPLIT = 100

###################
# LOAD EVERYTHING

embs, index = util.load_embs_matrix(EMBS)
X = []

with open(INPUTS) as f:
    for line in f:
        sent = util.preprocess_sent(line.split('_')[1])
        indices = util.get_indices(sent, index)
        X.append([indices])
        #X.append([util.preprocess_sent(line.split('_')[1])])

Y = np.loadtxt(LABELS)[:, 1:]
Y = scale(Y)
#Y += 100

###################
# PREPROCESS X
#X  = np.array([util.average_sent(sent, embs) for sent in X])
X = np.array(X, dtype=object)
X_train = X[:SPLIT]
Y_train = Y[:SPLIT]
X_test = X[-TEST_SPLIT:]
Y_test = Y[-TEST_SPLIT:].flatten()

print X_train.ndim
#print X_train

####################
# RIDGE
sk = flakes.wrappers.gpy.GPyStringKernel(gap_decay=0.1, match_decay=0.1, order_coefs=[1.0] * 5, 
                                         embs=embs, device='/cpu:0', mode='tf-batch', 
                                         batch_size=10, sim='dot', 
                                         wrapper='none')
k = sk #* GPy.kern.Bias(1)

m = GPy.models.GPRegression(X_train, Y_train, kernel=k)
print m
#m['.*variance.*'].constrain_fixed(0.5)
#m['.*decay.*'].constrain_bounded(0.0, 1.0)
#m['.*coefs.*'].constrain_bounded(0.0, 1.0)
#m['.*string.variance.*'].constrain_bounded(1e-4, 10)
#m.optimize_restarts(num_restarts=5, messages=True, max_iters=50)
m.optimize(messages=True, max_iters=50)
print m
print m['.*coefs.*']
preds = m.predict(X_test)[0].flatten()

for tup in zip(preds, Y_test)[:10]:
    print tup
print MAE(preds, Y_test)
print np.sqrt(MSE(preds, Y_test))
print pearsonr(preds, Y_test)

