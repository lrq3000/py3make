py3make
=======

|PyPI-Status| |PyPI-Versions|

|Build-Status| |Coverage-Status| |Branch-Coverage-Status| |Codacy-Grade| |Libraries-Rank|

|LICENCE|


Bring basic ``Makefile`` support to any system with Python.

Simply install with ``pip install py3make`` then execute ``py3make`` in a directory containing a ``Makefile``.

``py3make`` works on any platform (Linux, Windows, Mac, FreeBSD, Solaris/SunOS).

``py3make`` does not require any library to run, just a vanilla Python
interpreter will do.

The goal is not to reproduce a whole implementation of ``GNU make``, but only a very fast and succinct
commands runner. This is often used to ease running tests and deployments locally, before uploading to
a continuous integration/continuous deployment system such as GitHub Workflows.

Do not be fooled by the lack of updates: this module is very stable and is very frequently (daily) used
in most of `my Python projects <https://github.com/lrq3000?tab=repositories&q=&type=&language=python&sort=>`__.

This repository is a "fork" by the original author to regain full editing permissions stolen by a co-author,
to update this package with full freedom.

------------------------------------------

.. contents:: Table of contents
   :backlinks: top
   :local:


Installation
------------

Latest PyPI stable release
~~~~~~~~~~~~~~~~~~~~~~~~~~

|PyPI-Status| |PyPI-Downloads| |Libraries-Dependents|

.. code:: sh

    pip install py3make

Latest development release on GitHub
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

|GitHub-Status| |GitHub-Stars| |GitHub-Commits| |GitHub-Forks| |GitHub-Updated|

Pull and install in the current directory:

.. code:: sh

    pip install -e git+https://github.com/lrq3000/py3make.git


Changelog
---------

The list of all changes is available either on GitHub's Releases:
|GitHub-Status| or on crawlers such as
`allmychanges.com <https://allmychanges.com/p/python/py3make/>`_.


Usage
-----

Simply install then execute ``py3make -p`` to list commands and ``py3make <command>`` to use a command, in a directory containing a ``Makefile``.


Known Issues
------------

For compatibility, ensure:

1. Every alias is preceded by @[+]make (eg: @make alias)
2. A maximum of one @make alias or command per line

Sample makefile compatible with ``py3make``:

.. code:: sh

    PY=python -m py_compile
    .PHONY:
    	all
    	test
        install
        compile
    all:
    	@+make test
    	@make install
    test:
    	nosetest
    install:
    	python setup.py\
        install
    compile:
    	$(PY) test.py
    circle:
    	# of life
    	circle
    empty:
    	# this is a comment

If you get a "Permission Denied" error, please check if maybe your antivirus may be preventing the launch of compiled python scripts, if the Scripts subdirectory is in the PATH, or `other issues with the Python install <https://stackoverflow.com/questions/56974927/permission-denied-trying-to-run-python-on-windows-10>`__.

Documentation
-------------

|PyPI-Versions|

.. code:: sh

    py3make --help


Contributions
-------------

|GitHub-Commits| |GitHub-Issues| |GitHub-PRs|

All source code is hosted on `GitHub <https://github.com/lrq3000/py3make>`__.
Contributions are welcome.

See the
`CONTRIBUTE <https://raw.githubusercontent.com/lrq3000/py3make/master/CONTRIBUTE>`__
file for more information.


LICENCE
-------

Open Source (OSI approved): |LICENCE|


Authors
-------

The main developers, ranked by surviving lines of code
(`git fame -wMC <https://github.com/casperdcl/git-fame>`__), are:

- Stephen Karl Larroque (`lrq3000 <https://github.com/lrq3000>`__, core logic & maintenance Py3)
- Casper da Costa-Luis (`casperdcl <https://github.com/casperdcl>`__, modularization & self-referential aliases & ironing out edge cases & documentation)

We are grateful for all |GitHub-Contributions|!

.. |Build-Status| image:: https://github.com/lrq3000/py3make/actions/workflows/ci-build.yml/badge.svg?event=push
    :target: https://github.com/lrq3000/py3make/actions/workflows/ci-build.yml
.. |Coverage-Status| image:: https://coveralls.io/repos/github/lrq3000/py3make/badge.svg?branch=main
   :target: https://coveralls.io/github/lrq3000/py3make?branch=main
.. |Branch-Coverage-Status| image:: https://codecov.io/gh/lrq3000/py3make/branch/main/graph/badge.svg?token=JCKB7CEBCC 
   :target: https://codecov.io/gh/lrq3000/py3make
.. |Codacy-Grade| image:: https://app.codacy.com/project/badge/Grade/64b870375f664419b5f2a0a956006db7
   :target: https://app.codacy.com/gh/lrq3000/py3make/dashboard
.. |GitHub-Status| image:: https://img.shields.io/github/tag/lrq3000/py3make.svg?maxAge=86400&logo=github&logoColor=white
   :target: https://github.com/lrq3000/py3make/releases
.. |GitHub-Forks| image:: https://img.shields.io/github/forks/lrq3000/py3make.svg?logo=github&logoColor=white
   :target: https://github.com/lrq3000/py3make/network
.. |GitHub-Stars| image:: https://img.shields.io/github/stars/lrq3000/py3make.svg?logo=github&logoColor=white
   :target: https://github.com/lrq3000/py3make/stargazers
.. |GitHub-Commits| image:: https://img.shields.io/github/commit-activity/y/lrq3000/py3make.svg?logo=git&logoColor=white
   :target: https://github.com/lrq3000/py3make/graphs/commit-activity
.. |GitHub-Issues| image:: https://img.shields.io/github/issues-closed/lrq3000/py3make.svg?logo=github&logoColor=white
   :target: https://github.com/lrq3000/py3make/issues
.. |GitHub-PRs| image:: https://img.shields.io/github/issues-pr-closed/lrq3000/py3make.svg?logo=github&logoColor=white
   :target: https://github.com/lrq3000/py3make/pulls
.. |GitHub-Contributions| image:: https://img.shields.io/github/contributors/lrq3000/py3make.svg?logo=github&logoColor=white
   :target: https://github.com/lrq3000/py3make/graphs/contributors
.. |GitHub-Updated| image:: https://img.shields.io/github/last-commit/lrq3000/py3make/master.svg?logo=github&logoColor=white&label=pushed
   :target: https://github.com/lrq3000/py3make/pulse
.. |PyPI-Status| image:: https://img.shields.io/pypi/v/py3make.svg
   :target: https://pypi.org/project/py3make
.. |PyPI-Downloads| image:: https://img.shields.io/pypi/dm/py3make.svg?label=pypi%20downloads&logo=python&logoColor=white
   :target: https://pypi.org/project/py3make
.. |PyPI-Versions| image:: https://img.shields.io/pypi/pyversions/py3make.svg?logo=python&logoColor=white
   :target: https://pypi.org/project/py3make
.. |Libraries-Rank| image:: https://img.shields.io/librariesio/sourcerank/pypi/py3make.svg?logo=koding&logoColor=white
   :target: https://libraries.io/pypi/py3make
.. |Libraries-Dependents| image:: https://img.shields.io/librariesio/dependent-repos/pypi/py3make.svg?logo=koding&logoColor=white
    :target: https://github.com/lrq3000/py3make/network/dependents
.. |LICENCE| image:: https://img.shields.io/badge/License-MIT-yellow.svg
   :target: https://opensource.org/licenses/MIT
.. |LICENCEAUTO| image:: https://img.shields.io/pypi/l/py3make.svg
   :target: https://raw.githubusercontent.com/lrq3000/py3make/master/LICENCE
