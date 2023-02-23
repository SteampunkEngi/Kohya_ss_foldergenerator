# Kohya_ss_foldergenerator
Windows powershell script which automates creating folders for kohya_ss training, including generating a training config file.
Automatically sets the training_data, output_data, log_data paths in the config folder; no more copy pasting!
Also has the option to set the model name that you're training to "authorName_ModelName"
Saves NSFW map structures into a different folder (optional)

For an example of the folder structure, open the __NEW format folder in Github.

How to use:
1. Download the repo (All files. Click on the big green <code> button, download as zip, and unpack somewhere). 
2. Open the .ps1 with notepad, 
3. edit $authorName to your publication name, 
4. change $defaultSourcemodelPath to the path and file of the .ckpt/safetensor which you want to use as a default model to train on
5. Make sure the "__NEW format" folder and the "_NSFW" folder are in the same directory as the .ps1 script. 
5e. Optional: Change the default config settings in "__NEW format/settings.json". Do NOT change "logging_dir", "training_data_dir", "output_dir", and "output_name", these are automatically changed by the script
6. Either doubleclick it or run it in powershell (google if you don't know how to do this)
7. The script will ask for a model name. This will generate the folder names and model train output according to the input. 
E.G. If you set $authorName = "SteampunkEngi" in the .ps1 file, and then type in "Supercoolmodel", your trained model will end up being called SteampunkEngi_Supercoolmodel.
8. The script will ask you if the model is NSFW or not. Press Y or N and press enter. If Y is sent, the new folders will be generated in the _NSFW folder. If not, the new folders will be generated in the same directory as the .ps1 file.
