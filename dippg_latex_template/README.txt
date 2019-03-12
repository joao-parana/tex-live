IMPORTANT: Tip for TeXstudio

In the current release (2.6 branch), TeXstudio's build process ('Build & View') by default runs pdfLaTeX but not a bibliography tool, which you need to do separately.

1- CONFIGURE DEFAULT bibliography to Biber: There is also a need to change the settings to run Biber rather than BibTeX for creating a bibliography. For that do the folowing:

	- In the TeXstudio preferences ('Preferences ...' on the Mac or 'Options -> Configure TeXstudio' on Windows), choose the Build tab and alter the 'Default Bibliography' to 'Biber'. Save and close the preferences.

2- BUILD your document following these steps:

	- Run 'Build & View' from the 'Tools' menu (or press the two green arrows icon), which will create a PDF but with the bibliography not completed
	- Run 'Bibliography' from the 'Tools' menu.
	- Run 'Build & View' again: the bibliography will appear in the PDF.