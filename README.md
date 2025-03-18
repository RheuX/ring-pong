RingPong

### Reference

- https://blazorhelpwebsite.com/ViewBlogPost/15069#:~:text=Open%20a%20Godot%204%20file,com%20and%20create%20a%20repository
- https://huggingface.co/learn/deep-rl-course/en/unitbonus3/godotrl


### Steps on how to train the AI on godot live simulation:
- [Optional] Setup a Python environment (I made a script on root called `rl`, check it later)
- install `godot-rl`
- download [stable_baseline3](https://github.com/edbeeching/godot_rl_agents/blob/main/examples/stable_baselines3_example.py) and run it
- go to the directory, use `python stable_baselines3_example.py --timesteps=100_000 --onnx_export_path=model.onnx --save_model_path=model.zip --save_checkpoint_frequency=20_000 --experiment_name=exp1`
- after the prompt, play the godot editor

### After training (how to play the model you've trained)
- Go to sync in train.tscn, and change the control mode to `Onnx Inference`
- Input the `model` name in the Onnx Model Input Field (default is `model.onnx`)
- Make sure that the `model.onnx` is on the directory, and just run the godot editor
