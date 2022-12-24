link:
	rm -rf ${HOME}/.zshrc
	rm -rf ${HOME}/.oh-my-zsh
	ln -s ${PWD}/.zshrc ${HOME}/.zshrc
	cp -r ${PWD}/.oh-my-zsh ${HOME}/.oh-my-zsh
