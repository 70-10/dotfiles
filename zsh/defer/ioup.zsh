ioup() {
  asdf install nodejs lts;
  asdf global nodejs lts;
  npm cache verify;
  npm i -g \
    clipboard-cli \
    corepack \
    eslint \
    fkill-cli \
    np \
    npm-check \
    prettier \
    textlint \
    trash-cli;
}
