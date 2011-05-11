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
