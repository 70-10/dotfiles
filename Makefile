setup:
	@if ! [ `which brew` ]; then \
		echo "[+] Install Homebrew"; \
	  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; \
	fi; \

	@if ! [ `which ansible` ]; then \
		echo "[+] Install andible"; \
	  brew install ansible; \
	fi; \

	@echo "[+] setup playbook"
	@ansible-playbook -i playbook/hosts/mac -t mac playbook/setup.yml

.PHONY: setup
