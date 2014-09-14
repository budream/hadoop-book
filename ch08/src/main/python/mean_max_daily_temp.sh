STREAM="hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar -conf conf/hadoop-localhost.xml"

$STREAM \
  -D stream.num.map.output.key.fields=2 \
  -files ch08/src/main/python/max_daily_temp_map.py,\
ch08/src/main/python/max_daily_temp_reduce.py \
  -input input/ncdc/all \
  -output out_max_daily \
  -mapper ch08/src/main/python/max_daily_temp_map.py \
  -reducer ch08/src/main/python/max_daily_temp_reduce.py

$STREAM \
  -D stream.num.map.output.key.fields=2 \
  -files ch08/src/main/python/mean_max_daily_temp_map.py,\
ch08/src/main/python/mean_max_daily_temp_map.py \
  -input out_max_daily \
  -output out_mean_max_daily \
  -mapper ch08/src/main/python/mean_max_daily_temp_map.py \
  -reducer ch08/src/main/python/mean_max_daily_temp_reduce.py

  