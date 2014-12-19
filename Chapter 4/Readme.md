Chapter 4
=========


If you haven't done this yet, go to http://www.haskellcraft.com/craft3e/Start.html
and follow the instructions there.

Craft3e-0.1.0.10 is the package I used when reading the book, if this is your case too:

Replace your Craft3e.cabal with the file in C'4.cabal.zip from my github repository.
If you want to do it manually, this are the changes I made:

  - Open Craft3e.cabal in an editor.
  - Search for the line other-modules. Below it copy and remove the line "PicturesSVG".
  - Search for the line exposed-modules and insert the line below it.

Now open a shell and change the current directory to Craft3e-0.1.0.10.
Execute: cabal install --disable-documentation --force-reinstalls

Now importing PicturesSVG in C'4.hs should work.

The reason for all this is, that I didn't use the template-scripts from the Craft3e package.




