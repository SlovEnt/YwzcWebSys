# -*- coding: utf-8 -*-
__author__ = 'SlovEnt'
__date__ = '2018/3/28 21:22'


from django.conf.urls import url, include
from .views import GetTestRun

urlpatterns = [

    url('TestNNN/', GetTestRun.as_view(), name = 'TestNNN')


]