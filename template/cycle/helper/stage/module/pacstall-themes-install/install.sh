#!/usr/bin/env bash


################################################################################
### Head: Note
##

##
## ## Link
##
## * https://github.com/samwhelp/skel-project-plan/blob/master/develop/sh/project-helper/basic/helper/bin/prepare.sh
## * https://github.com/samwhelp/pacstall-packaging/tree/main/recipe/pacstall-packaging-deb/pacstall-packaging-deb
##

##
### Tail: Note
################################################################################


################################################################################
### Head: Bash
##

set -e						## exit on error
set -o pipefail				## exit on pipeline error
set -u						## treat unset variable as error

##
### Tail: Bash
################################################################################


################################################################################
### Head: Init
##

REF_CMD_FILE_NAME="$(basename "${0}")"
REF_BASE_DIR_PATH="$(cd -- "$(dirname -- "${0}")" ; pwd)"
REF_INIT_DIR_PATH="${REF_BASE_DIR_PATH}/../../../ext"
. "${REF_INIT_DIR_PATH}/init.sh"

##
### Tail: Init
################################################################################


################################################################################
### Head: Model / mod_module_pacstall_install
##

sys_pacstall_install_repository_add () {

	sys_pacstall_install_repository_add_deb_coffee

	sys_pacstall_install_repository_add_deb_coffee_maccity

	sys_pacstall_install_repository_add_deb_coffee_wincity


	return 0
}

sys_pacstall_install_repository_add_deb_coffee () {


	##
	## ## Link
	##
	## * https://github.com/samwhelp/deb-coffee
	##


	util_error_echo
	util_error_echo pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee/main"
	util_error_echo
	pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee/main"


	return 0
}

sys_pacstall_install_repository_add_deb_coffee_maccity () {


	##
	## ## Link
	##
	## * https://github.com/samwhelp/deb-coffee-maccity
	##


	util_error_echo
	util_error_echo pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee-maccity/main"
	util_error_echo
	pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee-maccity/main"


	return 0
}

sys_pacstall_install_repository_add_deb_coffee_wincity () {


	##
	## ## Link
	##
	## * https://github.com/samwhelp/deb-coffee-wincity
	##


	util_error_echo
	util_error_echo pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee-wincity/main"
	util_error_echo
	pacstall -QPA "https://raw.githubusercontent.com/samwhelp/deb-coffee-wincity/main"


	return 0
}

sys_pacstall_install_packages () {


	##
	## ## Example
	##
	## `sudo pacstall -QPINs nushell-bin`
	##
	## `sudo pacstall -QPI nushell-bin`
	##


local run_cmd=$(cat << __EOF__
	pacstall -QPINs
		bean-appearance-citrus-icon-theme
		bean-appearance-vimix-gtk-theme
		bean-appearance-vimix-kde-theme

		bean-appearance-orchis-kde-theme
		bean-appearance-graphite-kde-theme
		bean-appearance-fluent-kde-theme
		bean-appearance-colloid-kde-theme
		bean-appearance-layan-kde-theme
		bean-appearance-qogir-kde-theme
		bean-appearance-lavanda-kde-theme

__EOF__
)




	util_error_echo
	util_error_echo $run_cmd
	util_error_echo

	$run_cmd




	return 0
}


mod_module_pacstall_install () {

	sys_pacstall_install_repository_add

	sys_pacstall_install_packages

	return 0
}

##
### Tail: Model / mod_module_pacstall_install
################################################################################


################################################################################
### Head: Portal / portal_install
##

portal_install () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## ## Run Module"
	util_error_echo "##"
	util_error_echo

	local script_file_path="${REF_BASE_DIR_PATH}/${REF_CMD_FILE_NAME}"

	util_error_echo "[Run Module]: ${script_file_path}"


	mod_module_pacstall_install


}

##
### Tail: Portal / portal_install
################################################################################


################################################################################
### Head: Main
##

__main__ () {

	portal_install "${@}"

}

__main__ "${@}"

##
### Tail: Main
################################################################################
