#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
setup() {
    source $HOME/bin/dotfiles_env
    BATS_TMPDIR="/tmp/date_fold"
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
    local=$(pwd)
    if [ "$local" = "$HOME" ];then
	exit 1
    fi
    # Load include to test.
    mkdir -p "${BATS_TMPDIR}/level1/level2/level3/"
}
teardown() {
    rm -rf "${BATS_TMPDIR}"
}

@test "get last level file test" { 
    cd "${BATS_TMPDIR}" || return 
    magick -size 1x1 xc:white "${BATS_TMPDIR}/level1/level2/level3/20030107_file4.png"
    magick -size 1x1 xc:none "${BATS_TMPDIR}/level1/level2/20040207_file5.jpg"
    magick -size 1x1 xc:blue "${BATS_TMPDIR}/level1/20051107_file6.jpg"
    #debug if fail 
    echo "BEFORE Level3"
    find "${BATS_TMPDIR}" -mindepth 1

    date_fold -r "${BATS_TMPDIR}" #> /dev/null 2> /dev/null
    
    echo "AFTER Level3"
    find "${BATS_TMPDIR}" -mindepth 1

    [ -f "${BATS_TMPDIR}/2003/01/20030107_file4.png" ]
    [ -f "${BATS_TMPDIR}/2004/02/20040207_file5.jpg" ]
    [ -f "${BATS_TMPDIR}/2005/11/20051107_file6.jpg" ]

} 

@test "current folder test " { 
    cd "${BATS_TMPDIR}" || return 
    magick -size 1x1 xc:red "${BATS_TMPDIR}/20000107_file11.png"
    magick -size 1x1 xc:white "${BATS_TMPDIR}/20010207_file12.jpg"
    magick -size 1x1 xc:none "${BATS_TMPDIR}/20021107_file13.jpg"
    #debug if fail 
    echo "BEFORE Level3"
    find "${BATS_TMPDIR}" -mindepth 1

    date_fold "${BATS_TMPDIR}" #> /dev/null 2> /dev/null
    
    echo "AFTER Level3"
    find "${BATS_TMPDIR}" -mindepth 1

    [ -f "${BATS_TMPDIR}/2000/01/20000107_file11.png" ]
    [ -f "${BATS_TMPDIR}/2001/02/20010207_file12.jpg" ]
    [ -f "${BATS_TMPDIR}/2002/11/20021107_file13.jpg" ]
}
@test "date position on file name(bgin, mid, end) test" { 
    cd "${BATS_TMPDIR}" || return 
    magick -size 1x1 xc:white "${BATS_TMPDIR}/20000107_file21.png"
    magick -size 1x1 xc:white "${BATS_TMPDIR}/img_20010207_file22.jpg"
    magick -size 1x1 xc:white "${BATS_TMPDIR}/vid_file2_20021107.jpg"
    #debug if fail 
    echo "BEFORE Level3"
    find "${BATS_TMPDIR}" -mindepth 1

    date_fold "${BATS_TMPDIR}" > /dev/null 2> /dev/null
    
    echo "AFTER Level3"
    find "${BATS_TMPDIR}" -mindepth 1

    [ -f "${BATS_TMPDIR}/2000/01/20000107_file21.png" ]
    [ -f "${BATS_TMPDIR}/2001/02/img_20010207_file22.jpg" ]
    [ -f "${BATS_TMPDIR}/2002/11/vid_file2_20021107.jpg" ]
}

@test "there is a sequence of integers test" { 
    cd "${BATS_TMPDIR}" || return 
    magick -size 1x1 xc:white "${BATS_TMPDIR}/247899878234_20000107_file1.png"
    magick -size 1x1 xc:white "${BATS_TMPDIR}/img_82394872983-20010207-file2.jpg"
    magick -size 1x1 xc:white "${BATS_TMPDIR}/vid_234798729347_file_20021107.jpg"
    #debug if fail 
    echo "BEFORE Level3"
    find "${BATS_TMPDIR}" -mindepth 1

    date_fold "${BATS_TMPDIR}" #> /dev/null 2> /dev/null
    
    echo "AFTER Level3"
    find "${BATS_TMPDIR}" -mindepth 1

    [ -f "${BATS_TMPDIR}/2000/01/247899878234_20000107_file1.png" ]
    [ -f "${BATS_TMPDIR}/2001/02/img_82394872983-20010207-file2.jpg" ]
    [ -f "${BATS_TMPDIR}/2002/11/vid_234798729347_file_20021107.jpg" ]
}
@test "there are 3 or more arguments in file name test" { 
    cd "${BATS_TMPDIR}" || return
    mkdir -p "${BATS_TMPDIR}/Android_m35/Screenshot"
    magick -size 1x1 xc:white "${BATS_TMPDIR}/Android_m35/Screenshot/Screenshot_20220916_214012_Meu_TIM.jpg"
    magick -size 1x1 xc:black "${BATS_TMPDIR}/Android_m35/Screenshot/Screenshot_20231028_101543_Samsung_Internet.jpg"
    magick -size 1x1 xc:blue "${BATS_TMPDIR}/Android_m35/Screenshot/Screenshot_20241130_183831_Captive_Portal_Login.jpg"
    #debug if fail 
    echo "BEFORE Level3"
    find "${BATS_TMPDIR}" -mindepth 1

    date_fold -r "${BATS_TMPDIR}" #> /dev/null 2> /dev/null
    
    echo "AFTER Level3"
    find "${BATS_TMPDIR}" -mindepth 1

    [ -f "${BATS_TMPDIR}/2022/09/Screenshot_20220916_214012_Meu_TIM.jpg" ]
    [ -f "${BATS_TMPDIR}/2023/10/Screenshot_20231028_101543_Samsung_Internet.jpg" ]
    [ -f "${BATS_TMPDIR}/2024/11/Screenshot_20241130_183831_Captive_Portal_Login.jpg" ]
}
@test "there is not a date in file name, get from metadata test" { 
    cd "${BATS_TMPDIR}" || return 
    date="202312251000"    # YYYYMMDDhhmm
    magick -size 1x1 xc:white "${BATS_TMPDIR}/img_file2.jpg"
    touch -a -m -t "$date" "${BATS_TMPDIR}/img_file2.jpg" 
    #debug if fail 
    echo "BEFORE Level3"
    find "${BATS_TMPDIR}" -mindepth 1

    date_fold "${BATS_TMPDIR}" #> /dev/null 2> /dev/null
    
    echo "AFTER Level3"
    find "${BATS_TMPDIR}" -mindepth 1

    [ -f "${BATS_TMPDIR}/2023/12/img_file2.jpg" ]
}
@test "there are dupes files test" { 
    cd "${BATS_TMPDIR}" || return 
    magick -size 1x1 xc:white "${BATS_TMPDIR}/level1/level2/level3/same_20070707_file.png"
    cp "${BATS_TMPDIR}/level1/level2/level3/same_20070707_file.png" "${BATS_TMPDIR}/level1/"   #debug if fail 
    echo "BEFORE Level3"
    find "${BATS_TMPDIR}" -mindepth 1

    date_fold -r "${BATS_TMPDIR}" #> /dev/null 2> /dev/null
    
    echo "AFTER Level3"
    find "${BATS_TMPDIR}" -mindepth 1

    [ -f "${BATS_TMPDIR}/2007/07/same_20070707_file.png" ]
}
