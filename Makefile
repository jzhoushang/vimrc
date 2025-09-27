
.PHONY: install update

install:
ifeq (,$(wildcard ~/.vim/autoload/plug.vim))
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
ifneq (,$(wildcard ~/.vimrc))
	mv ~/.vimrc ~/.vimrc.old
endif
	cp -f ./vimrc ~/.vimrc
	vim -c "PlugInstall" -c "qa\!"

update:
	cp -f ~/.vimrc ./vimrc

