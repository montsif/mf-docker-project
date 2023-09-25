1.Abrir Docker desktop e iniciar el ambiente desde la consola
./conf_env.sh start

3. Para obtener el token que permite ingresar a Jupyter Notebook
./conf_env.sh token

4. Ingresar desde un navegador a: http://localhost:8888/
y completar con el token entregado en el paso anterior.

5. Ejecutar el notebook
Dataset "Absenteeism at work"
Datos provenientes de:https://www.kaggle.com/datasets/kewagbln/absenteeism-at-work-uci-ml-repositiory

6. El script en el Jupyter notebook realiza un breve analisis exploratorio de algunas variables y luego corre dos modelos predictivos (regresion lineal y support vector machine). Finalmente almacena los resultados en 2 archivos parquets, los cuales tambien se leen el en el jupyter notebook.

