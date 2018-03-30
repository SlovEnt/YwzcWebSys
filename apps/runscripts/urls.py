# -*- coding: utf-8 -*-
__author__ = 'SlovEnt'
__date__ = '2018/3/28 21:22'


from django.conf.urls import url, include
from .views import GetTestRun,GetTestRun2

urlpatterns = [

    url('TestNNN/', GetTestRun.as_view(), name = 'TestNNN'),
    url('Test_Run_Script/', GetTestRun2.as_view(), name = 'Test_Run_Script'),


]