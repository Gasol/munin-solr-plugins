# Copyright 2011 Gasol Wu. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification, are
# permitted provided that the following conditions are met:
#
#    1. Redistributions of source code must retain the above copyright notice, this list of
#       conditions and the following disclaimer.
#
#    2. Redistributions in binary form must reproduce the above copyright notice, this list
#       of conditions and the following disclaimer in the documentation and/or other materials
#       provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY Gasol Wu ''AS IS'' AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# The views and conclusions contained in the software and documentation are those of the
# authors and should not be interpreted as representing official policies, either expressed
# or implied, of Gasol Wu.

prefix = /usr
datadir = $(prefix)/share
sysconfdir = /etc
INSTALL = install

install:
	mkdir -p $(DESTDIR)$(sysconfdir)/munin/plugin-conf.d
	mkdir -p $(DESTDIR)$(sysconfdir)/munin/plugins
	mkdir -p $(DESTDIR)$(prefix)/share/munin/plugins

	$(INSTALL) -D -m 0644 solr.conf \
		$(DESTDIR)$(sysconfdir)/munin/plugin-conf.d/solr

	for file in `find plugins -type f`; do \
		$(INSTALL) -m 0755 $$file $(DESTDIR)$(datadir)/munin/plugins/; \
		ln -s $(DESTDIR)$(datadir)/munin/plugins/`basename $$file` $(DESTDIR)$(sysconfdir)/munin/plugins/`basename $$file`; \
	done

uninstall:
	rm -rf $(DESTDIR)$(sysconfdir)/munin/plugin-conf.d/solr
	for file in `find plugins -type f`; do \
		rm -rf $(DESTDIR)$(datadir)/munin/plugins/`basename $$file`; \
		rm -rf $(DESTDIR)$(sysconfdir)/munin/plugins/`basename $$file`; \
	done
