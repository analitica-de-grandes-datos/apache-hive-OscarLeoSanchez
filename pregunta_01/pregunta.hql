/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Compute la cantidad de registros por cada letra de la columna 1.
Escriba el resultado ordenado por letra. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- docker run --rm -it -v "$PWD":/workspace --name hive -p 5001:50070 -p 8088:8088 -p 8888:8888 jdvelasq/hive:2.3.9

DROP TABLE IF EXISTS data;
CREATE TABLE data (
        letter STRING,
        dates STRING,
        value INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';
LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE data;

INSERT OVERWRITE LOCAL DIRECTORY './output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','

SELECT letter, COUNT(letter) FROM data
GROUP BY letter;
