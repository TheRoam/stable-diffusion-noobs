1. Clone repository

git clone https://github.com/basujindal/stable-diffusion

2. Install conda

https://docs.conda.io/projects/conda/en/stable/user-guide/install/linux.html

3. Create folder "models/ldm/stable-diffusion-v1"

4. Place any model checkpoint in there, named "model.ckpt"

Download from:
https://huggingface.co/CompVis

5. Create conda environment (will setup required python packages to work properly
under "ldm" virtual environment)

conda env create -f environment.yaml
conda activate ldm

6. Run optimised scripts with options:

python3 optimizedSD/optimized_txt2img.py --prompt "Underwater life" --H 256 --W 256 --seed 27 --n_iter 2 --n_samples 4 --ddim_steps 50

 optimisedSD/txt2img_gradio.py "a modern view of christmas"
 
1 image in 1 iteration takes 20 minutes
