# Install/unInstall package files in LAMMPS
# mode = 0/1/2 for uninstall/install/update

mode=$1

# arg1 = file, arg2 = file it depends on

action () {
  if (test $mode = 0) then
    rm -f ../$1
  elif (! cmp -s $1 ../$1) then
    if (test -z "$2" || test -e ../$2) then
      cp $1 ..
      if (test $mode = 2) then
        echo "  updating src/$1"
      fi
    fi
  elif (test -n "$2") then
    if (test ! -e ../$2) then
      rm -f ../$1
    fi
  fi
}

# list of files with optional dependencies

action compute_temp_drude.cpp
action compute_temp_drude.h
action fix_drude_transform.cpp
action fix_drude_transform.h
action fix_drude.cpp
action fix_drude.h
action fix_langevin_drude.cpp
action fix_langevin_drude.h
action pair_thole.cpp
action pair_thole.h
action pair_lj_cut_thole_long.cpp
action pair_lj_cut_thole_long.h
