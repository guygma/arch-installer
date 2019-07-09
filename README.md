# Goal

This set of scripts is meant to be used in conjunction with `archiso`. It has
two main functions: 

1. Create a customized installation disk image with a local (offline)
   repository. 

2. Perform a template-guided install of archlinux taking user input for
   additional specifications.  

# Caveats

- For building the archiso image, at this point there is still some manual involvement required (though, tbh, less than typical and not a big deal). At least one package is suggested to be bootstrapped into the iso for more convenient and canonical installs of AUR packages and that is `aurutils`. 

# TODO
- need a prepare script to move files into place before making  archiso. in particular, the pkg files for the AUR database and then the `repo-add` command. 
