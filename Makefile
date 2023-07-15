# This Makefile runs tests and builds the package to upload to pypi
# To use this Makefile, pip install py3make
# then do: py3make <command>
# or: python.exe -m py3make <command>
# You also need to pip install also other required modules: `pip install flake8 coverage twine pytest pytest-cov validate-pyproject[all] pytest-xdist rstcheck` , or simply `pip install --editable .[test]`
# Up to Python 3.9 included, nosetests was used, but from 3.10 onward, support for it was dropped since it is not maintained anymore, so that pytest and pytest-cov are used instead.
# Then, cd to this folder, and type `py3make -p` to list all commands, then `py3make <command>` to run the related entry.
# To test on multiple Python versions, install them, install also the C++ redistributables for each (so that Cython works), and then type `py3make testtox`.
# CRITICAL NOTE: if you get a "FileNotFoundError" exception when trying to call @+python or @+make, then it is because you used spaces instead of a hard TAB character to indent! TODO: bugfix this. It happens only for @+ commands and for those after the first command (if the @+ command with spaces as indentation is the first and only statement in a command, it works!)
#
# IMPORTANT: for compatibility with `python setup.py make [alias]`, ensure:
# 1. Every alias is preceded by @[+]make (eg: @make alias)
# 2. A maximum of one @make alias or command per line

.PHONY:
	alltests
	all
	flake8
	test
	testnose
	testsetup
	testcoverage
	testtimer
	distclean
	coverclean
	prebuildclean
	clean
	toxclean
	installdev
	install
	build
	buildupload
	pypi
	help
	none
	run

help:
	@+make -p

alltests:
	@+make testcoverage
	@+make flake8
	@+make testsetup

all:
	@+make alltests
	@+make build

flake8:
	@+flake8 -j 8 --count --statistics --exit-zero .

test:
	tox --skip-missing-interpreters

testpyproject:
	validate-pyproject pyproject.toml -v

testsetuppost:
	twine check "dist/*"

testrst:
	rstcheck README.rst

testcoverage:
	# This is the preferred way to run the tests since Python 3.10
	@+make coverclean
	pip install -e . --upgrade
	# Run the tests
	# With PyTest, it is now necessary to first install the python module so that it is found (--cov=<module>)
	coverage run --branch -m pytest -v
	coverage report -m

testcoveragexdist:
	# This parallelizes tests to make them run faster, thanks to pytest-xdist
	@+make coverclean
	@+make installdevpep517
	# Run the tests
	# With PyTest, it is now necessary to first install the python module so that it is found (--cov=<module>)
	coverage run --branch -m pytest -n auto -v
	#coverage report -m  # cannot send a report from parallelized xdist

distclean:
	@+make coverclean
	@+make prebuildclean
	@+make clean
	@+make toxclean
prebuildclean:
	@+python -c "import shutil; shutil.rmtree('build', True)"
	@+python -c "import shutil; shutil.rmtree('dist', True)"
	@+python -c "import shutil; shutil.rmtree('py3make.egg-info', True)"
    # IMPORTANT: systematically delete `src/<project.name>.egg-info` folder before rebuilding, otherwise the list of included files will not get updated (it's in `SOURCES.txt` file in this folder)
    # also very important to delete egg-info before any new build or pip install, otherwise may cause an error that multiple egg-info folders are present
	@+python -c "import shutil; shutil.rmtree('src/py3make.egg-info', True)"
coverclean:
	@+python -c "import os; os.remove('.coverage') if os.path.exists('.coverage') else None"
	@+python -c "import shutil; shutil.rmtree('__pycache__', True)"
	@+python -c "import shutil; shutil.rmtree('tests/__pycache__', True)"
clean:
	@+python -c "import os, glob; [os.remove(i) for i in glob.glob('*.py[co]')]"
	@+python -c "import os, glob; [os.remove(i) for i in glob.glob('tests/*.py[co]')]"
toxclean:
	@+python -c "import shutil; shutil.rmtree('.tox', True)"

installdev:
	@+make prebuildclean
	@+python -m pip install --upgrade --editable .[test] --verbose --use-pep517

install:
	@+make prebuildclean
	@+python -m pip install --upgrade . --verbose --use-pep517

bandit:
    bandit py3make/*

build:
	# requires `pip install build`
	@+make testrst
	@+make prebuildclean
	#@+make testsetup
	@+make testpyproject
	# For build, do NOT use the -w flag, otherwise only the wheel will be built, but we need sdist for source distros such as Debian and Gentoo!
	@+python -sBm build
	@+make testsetuppost

upload:
	twine upload dist/*

buildupload:
	@+make build
	@+make pypi

none:
	# used for unit testing

run:
	python -Om py3make
