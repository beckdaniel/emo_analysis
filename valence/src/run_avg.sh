OMP_NUM_THREADS=1 python avg_model.py ../../data/instances.txt ../../data/affectivetext_test.valence.gold ../../embs/glove.6B.100d.txt ridge none ../results &
OMP_NUM_THREADS=1 python avg_model.py ../../data/instances.txt ../../data/affectivetext_test.valence.gold ../../embs/glove.6B.100d.txt svr none ../results &
OMP_NUM_THREADS=1 python avg_model.py ../../data/instances.txt ../../data/affectivetext_test.valence.gold ../../embs/glove.6B.100d.txt rbf none ../results &
OMP_NUM_THREADS=1 python avg_model.py ../../data/instances.txt ../../data/affectivetext_test.valence.gold ../../embs/glove.6B.100d.txt mat32 none ../results &
OMP_NUM_THREADS=1 python avg_model.py ../../data/instances.txt ../../data/affectivetext_test.valence.gold ../../embs/glove.6B.100d.txt mat52 none ../results &
OMP_NUM_THREADS=1 python avg_model.py ../../data/instances.txt ../../data/affectivetext_test.valence.gold ../../embs/glove.6B.100d.txt ratquad none ../results &
OMP_NUM_THREADS=1 python avg_model.py ../../data/instances.txt ../../data/affectivetext_test.valence.gold ../../embs/glove.6B.100d.txt linear none ../results &
OMP_NUM_THREADS=1 python avg_model.py ../../data/instances.txt ../../data/affectivetext_test.valence.gold ../../embs/glove.6B.100d.txt mlp none ../results &

OMP_NUM_THREADS=1 python avg_model.py ../../data/instances.txt ../../data/affectivetext_test.valence.gold ../../embs/glove.6B.100d.txt ridge scale ../results &
OMP_NUM_THREADS=1 python avg_model.py ../../data/instances.txt ../../data/affectivetext_test.valence.gold ../../embs/glove.6B.100d.txt svr scale ../results &
OMP_NUM_THREADS=1 python avg_model.py ../../data/instances.txt ../../data/affectivetext_test.valence.gold ../../embs/glove.6B.100d.txt rbf scale ../results &
OMP_NUM_THREADS=1 python avg_model.py ../../data/instances.txt ../../data/affectivetext_test.valence.gold ../../embs/glove.6B.100d.txt mat32 scale ../results &
OMP_NUM_THREADS=1 python avg_model.py ../../data/instances.txt ../../data/affectivetext_test.valence.gold ../../embs/glove.6B.100d.txt mat52 scale ../results &
OMP_NUM_THREADS=1 python avg_model.py ../../data/instances.txt ../../data/affectivetext_test.valence.gold ../../embs/glove.6B.100d.txt ratquad scale ../results &
OMP_NUM_THREADS=1 python avg_model.py ../../data/instances.txt ../../data/affectivetext_test.valence.gold ../../embs/glove.6B.100d.txt linear scale ../results &
OMP_NUM_THREADS=1 python avg_model.py ../../data/instances.txt ../../data/affectivetext_test.valence.gold ../../embs/glove.6B.100d.txt mlp scale ../results &