# Densetsu-no-Stafi_4_TranslationToolset_Prototype
A prototype toolset for Translating Densetsu no Stafi 4 for the NDS.

This is a prototype toolset for a potential transation of the mentioned title.
This set uses the combination of Armips, Atlas, and Cartographer to extract and translation of the BMG files found within the overlay files and the Arm9 binary.

Sadly, only the game's intro is ready for translation as this is still a WIP prototype set.
However, some major issues are (hopefully) resolved in regards to ram space for certain BMG files.
I unfortunately do not have the time to continue working on the toolset due to changing conditions for work.
So I will leave it up here for others to study and hopefully find some use for this toolset and expand upon it.

The intended goal for this toolset is to try to make it easier for translation teams who may not have much romhacking experience and hopefully see translations for other languages.
Hopefully this could be a good starting point for those who choose to work off of this.



Now there are some files that may need explaining such as "BMGTemplate.asm"

BMGTemplate.asm
This file is used to create our own BMG files from modified bin files created by atlas.
All you have to do is copy and paste this file and rename it to the bmg file you are replacing and modify it to add the bin files to it. an example is provided for Overlay 14's bmg file for the game's intro.
Now this is meant to hopefully replace the use of Wiim's wbmgt tool from his toolchain. Honestly, it's a great tool for those just translating to english. However, using the combination of Armips with the template and Atlas, we could open up more possibilites for more languages because of custom tbl files. Though it should known that the bmg files from the game may have it's pointers not in a specified order so please pay VERY close attention.

TBL files
TBL files are one of THE most important files to learn about. They're reference files telling both Cartographer and Atlas which hex order represents a letter (or character) shown in a game's text. Sometimes it could be as simple as "8140=space" or as very complex as "012345 = Redname" (It's not a real code, just an example). A tbl file has been made for the game's intro as a test for Atlas and Cartographer. However, it may not match the coding for the rest of the game so be aware if something happens. My advice is to play with a copy of the bmg file and make small changes to figure out what code represents what and add it to the table. Typically there's two tables, One for reading and one for writing. It's up to you to make those tables work!

BMG files
BMG files are essential files that contain text.
However, depending on the game, they may be configured differently. Such examples would be if the game is japanese, it'd probably be configured to use shift-jis formatted text.
Or it could be configured to have messages arranged in a certain order.
You'd need to make modified version of these files for new text to show up in game.
The BMGmaker template should give you as much info as you need to make your own bmg files.




About the apps....
Atlas
Atlas is used to store new text into a rom by reading a formatted txt file and using a tbl file as a reference for text to hex. Look at "INTROREAD.tbl" and "INTROWRITE.tbl" as an example.

Cartographer
Cartographer is the reverse of Atlas. Instead of inserting new text into the rom, it actually extracts text into a txt files with the help of a settings text file and a tbl file formatted to the game's encoding.

Armips
Armips is basically the brains of operation, it helps calculate pointers for various things like text and images, or help create new files such as the BMGmaker Template used to make BMG files. It can also inject new code if you know what you are doing.




Intended Work flow
My recommendation would be use Cartographer with the extracted bmg files to extract each message into seperate txt files.
After that make a backup of them incase something happens. Then modify the txt files with english text (I suggest using notepad++ for this).
Then open preparetext.bat on a notepad app (again I recommend notepad++) and add your modified txt files. (The format should already be made just copy overlay14's as an example).
Then run build.bat and you should have a working rom with new text. (Atleast that's the short summary of it.)