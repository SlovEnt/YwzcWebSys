
modelStr = '''
    dev_id = models.ForeignKey(DevBaseInfo, on_delete=models.CASCADE, db_column="dev_id", related_name='dev_id_mr')
    dev_name = models.ForeignKey(DevBaseInfo, on_delete=models.CASCADE, db_column="dev_name", related_name='dev_name_mr')
    mainta_date = models.DateField(verbose_name="维修日期")
    instructions = UEditorField(blank=True, verbose_name="维修项目说明", width=800, height=400, imagePath="device/ueditor/",filePath="device/ueditor/", default='')

'''.strip()


lineStr = ""
for x in modelStr.splitlines():
    x = x.replace(" ", "")
    paraArr = x.split("=")

    if paraArr[0]:
        print(paraArr[0])
        if lineStr == "":
            lineStr = "'%s'" %  (paraArr[0])
        else:
            lineStr = "%s,'%s'" %  (lineStr, paraArr[0])
print("[%s]" % lineStr)