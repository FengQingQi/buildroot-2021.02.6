#/bin/bash
BUILDROOT_DIR="buildroot-2021.02.6"

#说明：当前目录为 /home/f1c100s/buildroot-2021.02.6
DIR=$(cd $(dirname $0) && pwd )

printf_info(){
	local BN=`basename $1`
	echo "							              "
	echo "****************************************************************"
	echo "Please input target                                             "
	echo "Usage:							      "
	echo "	$BN <licheepi|mangopi>                                        "
	echo "explain:                                                        "
	echo "    licheepi  : compile licheepi buildroot and dtb			  "
	echo "    mangopi   : compile mangopi  buildroot and dtb		      "
	echo "****************************************************************"
	echo "								      "
}

build_licheepi()
{
	cd ${DIR}/$BUILDROOT_DIR
	make licheepi_nano_defconfig
	make 
}

build_mangopi()
{
	cd ${DIR}/$BUILDROOT_DIR
	make mangopi_r3_defconfig
	make 
}


build_select_compile()
{
	case ${Para1} in
	licheepi)
		echo ===================build:$@====================
		build_licheepi
		;;	
	mangopi)
		echo ===================build:$@====================
		build_mangopi
		;;
	*)
		printf_info $0
		;;
    esac
}

#-----------------------------main---------------------------------


Para1=$1

build_select_compile

#------------------------------------------------------------------

