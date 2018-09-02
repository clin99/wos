FILE_NAME=wos

read: pdf
	evince -f $(FILE_NAME).pdf &


pdf: ps
	ps2pdf $(FILE_NAME).ps
	bibtex $(FILE_NAME)

ps: dvi
	dvips -t letter -Pdownload35 -o $(FILE_NAME).ps $(FILE_NAME).dvi


dvi: 
	latex $(FILE_NAME).tex

clean: 
	rm $(FILE_NAME).{ps,pdf,log,aux,dvi}

backup: 
	tar -cvzf backup.tar.gz *

