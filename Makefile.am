datadir=$(datarootdir)/munin

pluginsdir=$(datadir)/plugins
dist_plugins_SCRIPTS=plugins/solr_request_per_second plugins/solr_time_per_request

pluginconfdir=$(sysconfdir)/munin/plugin-conf.d
dist_pluginconf_DATA=solr.conf

install-data-hook:
	$(MKDIR_P) $(DESTDIR)$(sysconfdir)/munin/plugins
	$(LN_S) $(DESTDIR)$(datadir)/plugins/solr_request_per_second \
		$(DESTDIR)$(sysconfdir)/munin/plugins/solr_request_per_second
	$(LN_S) $(DESTDIR)$(datadir)/plugins/solr_time_per_request \
		$(DESTDIR)$(sysconfdir)/munin/plugins/solr_time_per_request
