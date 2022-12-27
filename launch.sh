#!/bin/bash
#start date in seconds since 1970
ti=$(date +%s)
echo $(date)

echo "------ STARTING OPTIMISED STABLE-DIFFUSION ------"

echo "-- SETTING UP CONDA 'ldm' ENVIRONMENT --"

#needed for bash to recognise conda variables
source /home/$(whoami)/anaconda3/etc/profile.d/conda.sh
#activate 'ldm' environment
conda activate ldm

echo "-- SETUP COMPLETE --"

echo "  INTRODUCE A DESCRIPTION TO GENERATE IMAGES:"
#read user prompt input
read p

echo "  NUMBER OF IMAGES PER ITERATION:"
read -e -i 3 im

echo "  NUMBER OF ITERATIONS:"
read -e -i 2 it

echo "  IMAGE SIZE:"
read -e -i 512 s

echo "  TIME STEPS:"
read -e -i 50 t

echo "  SEED:"
read -e -i 17 sd

echo "  RUNNING OPTIMISED STABLE-DIFFUSION IMAGE GENERATION BY BASUJINDAL FOR '"$p"' IN "$it" ITERATIONS OF "$im" IMAGES ("$(($im*$it))" IMAGES) WITH "$s"x"$s" IMAGE PIXEL SIZE USING SEED "$sd

#launch stable diffusion
python3 optimizedSD/optimized_txt2img.py --prompt "$p" --H $s --W $s --n_iter $it --n_samples $im --ddim_steps $t --seed $sd

#end date in seconds since 1970
tf=$(date +%s)

echo $(date)

time=$(($tf-$ti))

if [ $time -lt 60 ]; then
	echo $time" seconds"
else
	echo $(($time/60))" minutes "$(($time%60))" seconds"
fi

echo "------ FINISHED OPTIMISED STABLE-DIFFUSION ------"
echo "-- PRESS [ENTER] TO QUIT --"

read q
