#!/bin/bash
#SBATCH --job-name=raft
#SBATCH --partition=HGX
#SBATCH --account=research
#SBATCH --qos=lv0b
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=200G
#SBATCH --time=24:00:00
#SBATCH --cpus-per-task=16
#SBATCH --gres=gpu:1
#SBATCH --output=raft_videochatgpt_of.out
#SBATCH --error=raft_videochatgpt_of.error.out

    
# extract flow of videochatgpt
python main.py \
    feature_type=raft \
    on_extraction=save_numpy \
    device="cuda:0" \
    batch_size=64 \
    side_size=224 \
    file_with_video_paths=videochatgpt_path_1.txt \
    output_path=/home/wangyuxuan1/data/videoinstruction/videochatgpt_tune_of \
    extraction_fps=2 \