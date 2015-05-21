is_windows() {
    case "$(uname -s)" in
        CYGWIN*|MINGW32*|MSYS*)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

STEP_COUNT=1
LAST_STEP_MSG=""

if ! is_windows; then
    reset=$(tput sgr0)
    bold=$(tput bold)
    underline=$(tput sgr 0 1)
    blue=$(tput setaf 38)
    orange=$(tput setaf 208)
    gray=$(tput setaf 247)
    red=$(tput setaf 1)
    green=$(tput setaf 76)
fi

e_de_logo() {
    printf "${reset}${bold}"
    printf "\n${gray}                       :\`\`${orange}\`:;;.  \`;;;::,"
    printf "\n${gray}                    .:\`     ${orange}\`;;;:   \`;;;;;."
    printf "\n${gray}                  .\`   ....   ${orange}\`;;;;   ;;;;;"
    printf "\n${gray}                 .\`   ......   ${orange},;;;;   ;;;;"
    printf "\n${gray}                ..    ......   ${orange}\`;;;;   ;;;."
    printf "\n${gray}               ..      ....    ${orange},;;;;  :;;:"
    printf "\n${gray}               ..              ${orange};;;;   ;;."
    printf "\n${gray}               ..             ${orange};;;;   ;;"
    printf "\n${gray}                .\`           ${orange};;;:   ;."
    printf "\n${gray}                 \`..       ${orange};;;     ."
    printf "\n${gray}                   \`..   ${orange};;"
    printf "\n${gray}                     \`:;${orange};"
    printf "\n${orange}                    .;\`  ${gray}\`\`..."
    printf "\n${orange}                 .:\`          ${gray}\`\`\`\`\`"
    printf "\n${orange}               \`\`"
    printf "${reset}"
}

e_header() {
    printf "\n${bold}${blue}==========  %s  ==========${reset}\n" "$@"
}

e_step() {
    printf "${underline}${bold}${blue}\t➜ PASSO $STEP_COUNT:${reset} %s" "$@"
    STEP_COUNT=$((STEP_COUNT+1))
    LAST_STEP_MSG="$@"
}

e_check() {
    printf " ${green}✔${reset}\n"
}

e_error() {
    ERROR=""
    if [ "$LAST_STEP_MSG" == "" ] || [ -n "$@" ]; then
        ERROR="$@"
    else
        ERROR="$LAST_STEP_MSG"
    fi
    printf "${red}✖ %s${reset}\n" "$ERROR" >&2
    LAST_STEP_MSG=""
}

e_done() {
    printf "\t${green}✔ Script $0 finalizado com sucesso! ✔${reset}\n"
}

check_dependency() {
    if [ ! $(type -P $1) ]; then
        e_error "Commando '$1' não encontrado!"
        exit 1
    fi
}

check_git_dirty() {
    if [[ -n "$(git status -s 2> /dev/null)" ]]; then
        e_error "Diretório git está sujo. Commit ou desfaça suas alterações."
        exit 1
    fi
}
