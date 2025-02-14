# BikeStore

Este repositorio contiene una colección de ejercicios prácticos de MySQL basados en la base de datos ClassicModels. Los ejercicios fueron propuestos y verificados con la ayuda de ChatGPT, y están organizados en un nivel de dificultad ascendente, desde consultas básicas hasta más avanzadas. Además, el repositorio incluye scripts para la creación de la base de datos, la inserción de datos, y preguntas con sus respectivas soluciones.


## Estructura del Repositorio 🌐

```
│── docs                             # carpeta con los .csv de las tablas
├── Creación base.sql                # Script para crear BBDD
│── Ejercicios resueltos.png         # Lista de ejercicios y cómo resolverlos
│── LICENSE                          # Licencia
│── README.md                        # Documentación del repositorio
│── modelo ER.png                    # Imágen del diagrama ER de la base de datos

```

## 🖥️ Base de datos: BikeStore

La base de datos ClassicModels simula una tienda de autos, con diversas tablas que almacenan informacion sobre productos, clientes, empleados, ordenes y pagos.

## Temas vistos:
Los ejercicios incluyen una amplia gama de temas y técnicas de SQL, organizados por nivel de dificultad. Algunos de los temas cubiertos en los ejercicios son:

- Consultas SELECT básicas y avanzadas
- Filtrado y ordenación de datos
- Funciones agregadas (SUM, COUNT, AVG, etc.)
- Subconsultas (en la cláusula SELECT, WHERE, FROM, etc.)
- Operadores de comparación y lógicos
- Uniones (JOINs) (INNER JOIN, LEFT JOIN, etc.)
- Funciones de ventana (como ROW_NUMBER(), RANK(), etc.)
- Agrupación de datos (GROUP BY, HAVING)
- Ordenación dinámica de resultados
- Cálculo de totales y promedios
- Manejo de fechas (comparación, extracción de partes, etc.)

### Algunos ejercicios y sus resultados:

- Ejercicio 1: Calcula el total de ventas para cada producto (cantidadOrdered * priceEach) y muestra solo aquellos productos cuyo total supere el promedio de ventas de todos los productos, ordenado de mayor a menor.

<img src="https://drive.google.com/uc?export=view&id=1pRQMywW91FLbvTMskQOaUpNBrG4sJihA" alt="Script 1" width="450"> 

<img src="https://drive.google.com/uc?export=view&id=1RQBh9_DIiY_72L2WfAI1VhdBtQoHw3rV" alt="Ejercicio 1" width="300"> 

- Ejercicio 9: Obtén el ranking de empleados basado en el total de ventas que han realizado, mostrando el nombre del empleado, su oficina y el total vendido, ordenado de mayor a menor (Utiliza funciones de ventana o variables de usuario para asignar el ranking).

<img src="https://drive.google.com/uc?export=view&id=1o7gI4mZNMjat56nrjhBWUBeqByHTVQZI" alt="Script 9" width="450"> 

<img src="https://drive.google.com/uc?export=view&id=1Ckm0Nv1qmUnJC6NN4vg-k7_k4ss_ClvG" alt="Ejercicio 9" width="300"> 

- Ejercicio 14: Consulta el empleado que más ventas ha realizado en cada oficina, mostrando el nombre del empleado, el nombre de la oficina y el total de ventas, usando subconsultas correlacionadas o funciones de agregación.

<img src="https://drive.google.com/uc?export=view&id=16Flk8tVe7CD0UCBHIQ9VZq1FbiCMWfFY" alt="Script 14" width="530"> 

<img src="https://drive.google.com/uc?export=view&id=1ectvfHg5PvIsszFtN97EEFN7Vv01Gj-w" alt="Ejercicio 14" width="260"> 

Este proyecto está bajo la licencia MIT. Puedes usarlo libremente para aprendizaje y enseñanza.
