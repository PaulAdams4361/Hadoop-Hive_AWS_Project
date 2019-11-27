title "Two-Way ANOVA for with MapReduce Schema Data as Repeated Measure Design";
FILENAME REFFILE 'C:/Users/Pablo/Desktop/DB7330/results_analysis/results.csv';
PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=df;
	GETNAMES=YES;
RUN;
proc print data=df(obs=10);
run;
proc glm data = df plots=all;
  class schema block_size;
  model time = schema|block_size;
  repeated block_size 3/printe;
run;
