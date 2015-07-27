# Usage

* enter personal data in metadata.yml (and metadata-epub.yml if needed)
* change name of thesis files in Makefile (currently just "thesis", this will change the make targets as well)
* compile using `make thesis.pdf` (or html, epub)
* clean all compiled files up with `make clean`
* clean just latex's intermediate files with `make clean-auxiliaries`
