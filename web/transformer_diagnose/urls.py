from django.conf.urls import patterns, include, url

from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static


admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'transformer_diagnose.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', 'myproject.views.home', name='home'),
    url(r'^oildata$', 'myproject.views.oildata', name='oildata'),
    url(r'^initial_score$', 'myproject.views.initial_score', name='initial_score'),
    url(r'^threshold$', 'myproject.views.threshold', name='threshold'),
    url(r'^trans_dc_para$', 'myproject.views.trans_dc_para', name='trans_dc_para'),
    url(r'^trans_estimate$', 'myproject.views.trans_estimate', name='trans_estimate'),
    url(r'^trans_gasdata$', 'myproject.views.trans_gasdata', name='trans_gasdata'),
    url(r'^trans_para$', 'myproject.views.trans_para', name='trans_para'),
    url(r'^trans_record$', 'myproject.views.trans_record', name='trans_record'),
    url(r'^get_predict$', 'myproject.views.get_predict', name='get_predict'),
    url(r'^get_tend$', 'myproject.views.get_tend', name='get_tend'),
    url(r'^score_info$', 'myproject.views.score_info', name='score_info'),
)+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
