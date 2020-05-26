import numpy as np

# load data for this peculiar sample.
sample_batch = "Wisconsin batch III -- die 2 "
sample_name  = "sample 2"

from V2_software.utility.load_exp import load_experiment
load_experiment(sample_batch, sample_name)
from qdev_wrappers.show_num import show_num, show_meta
import matplotlib.pyplot as plt

