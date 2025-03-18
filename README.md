# RingPong

RingPong is an AI-driven Pong-like game built in **Godot** using **Godot-RL** by [Edward Beeching](https://github.com/edbeeching/godot_rl_agents). This project is my first interaction with **reinforcement learning (RL) in Godot**, following a tutorial from **Hugging Face’s Deep RL Course**. 

## Enhancing the AI with a "Red Ball" Mechanic
During training, I noticed an exploit in the AI’s behavior where it **stuck the ball to the paddle** to maximize points. To counter this, I introduced a **Red Ball**:
- **White Ball:** +1 reward for hitting it.
- **Red Ball:** -3 penalty if touched.
- **New AI Behavior:** The AI initially tries to stick the ball to the paddle but **quickly dodges when the ball turns red**, leading to a more dynamic and strategic gameplay.

---

## Reference Materials
- [Blazor Help Website Guide](https://blazorhelpwebsite.com/ViewBlogPost/15069#:~:text=Open%20a%20Godot%204%20file,com%20and%20create%20a%20repository)
- [Hugging Face Deep RL Course - Godot](https://huggingface.co/learn/deep-rl-course/en/unitbonus3/godotrl)

---

## Getting Started: Training the AI in Godot
### **Step 1: Environment Setup (Optional)**
1. Set up a **Python environment** (you could use `pyenv` or `conda`)
2. Install `godot-rl`:
   ```sh
   pip install godot-rl
   ```
### **Step 2: Running Training**
1. Download [stable_baselines3_example.py](https://github.com/edbeeching/godot_rl_agents/blob/main/examples/stable_baselines3_example.py).
2. Navigate to the script's directory and run:
   ```sh
   python stable_baselines3_example.py --timesteps=100_000 \
    --onnx_export_path=model.onnx \
    --save_model_path=model.zip \
    --save_checkpoint_frequency=20_000 \
    --experiment_name=exp1
   ```
3. Once the training starts (they will prompt you to play the godot editor), open Godot Editor to observe

## Playing with Your Trained Model
1. Open train.tscn in Godot.
2. Go to Sync and change Control Mode to Onnx Inference.
3. Enter your trained model’s filename in the Onnx Model Input Field (default: model.onnx).
4. Ensure model.onnx is in the correct directory.
5. Run Godot Editor and watch the AI play!

## Gameplay Demonstration
Here’s a quick demo showing the AI in action, including the reward system in real time:
[Insert Video Here]

## Feedback & Contributions
This is an experimental project as it's my first exposure to Godot and Godot-RL. I’d love to hear your thoughts! Feel free to:
- Report issues or suggest improvements via GitHub.
- Fork and modify the game to try new AI behaviors!
- Reach out if you’re also experimenting with Godot and reinforcement learning.
