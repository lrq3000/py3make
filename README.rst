py3make
=======

|PyPI-Status| |PyPI-Versions|

|Build-Status| |Coverage-Status| |Branch-Coverage-Status| |Codacy-Grade| |Libraries-Rank|

|DOI-URI| |LICENCE| |OpenHub-Status|


Bring basic ``Makefile`` support to any system with Python.

Simply install with ``pip install py3make`` then execute ``py3make`` in a directory containing a ``Makefile``.

``pymake`` works on any platform (Linux, Windows, Mac, FreeBSD, Solaris/SunOS).

``pymake`` does not require any library to run, just a vanilla Python
interpreter will do.

The goal is not to reproduce a whole implementation of ``GNU make``, but only a very fast and succinct
commands runner. This is often used to ease running tests and deployments locally, before uploading to
a continuous integration/continuous deployment system such as GitHub Workflows.

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

    pip install py-make

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

Sample makefile compatible with ``pymake``:

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

|PyPI-Versions| |README-Hits| (Since 28 Oct 2016)

.. code:: sh

    pymake --help


Contributions
-------------

|GitHub-Commits| |GitHub-Issues| |GitHub-PRs| |OpenHub-Status|

All source code is hosted on `GitHub <https://github.com/lrq3000/py3make>`__.
Contributions are welcome.

See the
`CONTRIBUTE <https://raw.githubusercontent.com/lrq3000/py3make/master/CONTRIBUTE>`__
file for more information.


LICENCE
-------

Open Source (OSI approved): |LICENCE|

Citation information: |DOI-URI|


Authors
-------

The main developers, ranked by surviving lines of code
(`git fame -wMC <https://github.com/casperdcl/git-fame>`__), are:

- Stephen Karl Larroque (`lrq3000 <https://github.com/lrq3000>`__, core logic & maintenance)
- Casper da Costa-Luis (`casperdcl <https://github.com/casperdcl>`__, modularization & self-referential aliases & ironing out edge cases)

We are grateful for all |GitHub-Contributions|!

.. |Build-Status| image:: https://img.shields.io/travis/lrq3000/py3make/master.svg?logo=travis
   :target: https://travis-ci.org/lrq3000/py3make
.. |Coverage-Status| image:: https://coveralls.io/repos/lrq3000/py3make/badge.svg?branch=master
   :target: https://coveralls.io/github/lrq3000/py3make
.. |Branch-Coverage-Status| image:: https://codecov.io/gh/lrq3000/py3make/branch/master/graph/badge.svg
   :target: https://codecov.io/gh/lrq3000/py3make
.. |Codacy-Grade| image:: https://api.codacy.com/project/badge/Grade/1f1dab515f294a05af8fc45e200660e5
   :target: https://www.codacy.com/app/lrq3000/py3make/dashboard
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
.. |PyPI-Status| image:: https://img.shields.io/pypi/v/py-make.svg
   :target: https://pypi.org/project/py-make
.. |PyPI-Downloads| image:: https://img.shields.io/pypi/dm/py-make.svg?label=pypi%20downloads&logo=python&logoColor=white
   :target: https://pypi.org/project/py-make
.. |PyPI-Versions| image:: https://img.shields.io/pypi/pyversions/py-make.svg?logo=python&logoColor=white
   :target: https://pypi.org/project/py-make
.. |Libraries-Rank| image:: https://img.shields.io/librariesio/sourcerank/pypi/py-make.svg?logo=koding&logoColor=white
   :target: https://libraries.io/pypi/py-make
.. |Libraries-Dependents| image:: https://img.shields.io/librariesio/dependent-repos/pypi/py-make.svg?logo=koding&logoColor=white
    :target: https://github.com/lrq3000/py3make/network/dependents
.. |OpenHub-Status| image:: https://www.openhub.net/p/tqdm_py-make/widgets/project_thin_badge?format=gif
   :target: https://www.openhub.net/p/tqdm_py-make?ref=Thin+badge
.. |LICENCE| image:: https://img.shields.io/pypi/l/py-make.svg
   :target: https://raw.githubusercontent.com/lrq3000/py3make/master/LICENCE
.. |DOI-URI| image:: https://img.shields.io/badge/DOI-10.5281/zenodo.2546871-blue.svg
   :target: https://doi.org/10.5281/zenodo.2546871
