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

testnose:
	nosetests pymake -d -v

testsetup:
	python setup.py check --metadata --restructuredtext --strict
	python setup.py make none

testcoverage:
	@make coverclean
	nosetests pymake --with-coverage --cover-package=pymake --cover-erase --cover-min-percentage=80 -d -v

testtimer:
	nosetests pymake --with-timer -d -v

distclean:
	@+make coverclean
	@+make prebuildclean
	@+make clean
prebuildclean:
	@+python -c "import shutil; shutil.rmtree('build', True)"
	@+python -c "import shutil; shutil.rmtree('dist', True)"
	@+python -c "import shutil; shutil.rmtree('pymake.egg-info', True)"
coverclean:
	@+python -c "import os; os.remove('.coverage') if os.path.exists('.coverage') else None"
	@+python -c "import shutil; shutil.rmtree('pymake/__pycache__', True)"
	@+python -c "import shutil; shutil.rmtree('pymake/tests/__pycache__', True)"
clean:
	@+python -c "import os, glob; [os.remove(i) for i in glob.glob('*.py[co]')]"
	@+python -c "import os, glob; [os.remove(i) for i in glob.glob('pymake/*.py[co]')]"
	@+python -c "import os, glob; [os.remove(i) for i in glob.glob('pymake/tests/*.py[co]')]"
	@+python -c "import os, glob; [os.remove(i) for i in glob.glob('pymake/examples/*.py[co]')]"
toxclean:
	@+python -c "import shutil; shutil.rmtree('.tox', True)"


installdev:
	python setup.py develop --uninstall
	python setup.py develop

install:
	python setup.py install

build:
	@make prebuildclean
	@make testsetup
	python setup.py sdist bdist_wheel
	# python setup.py bdist_wininst

pypi:
	twine upload dist/*

buildupload:
	@make build
	@make pypi

none:
	# used for unit testing

run:
	python -Om pymake
