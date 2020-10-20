# MultasCDMX
Proyecto de multas

##Uso
Abrir en NetBeans el proyecto “Pastor enchilado” que viene en la carpeta “web” y correr la aplicación (Si NetBeans lanza un error solo instalamos las dependecias que falten, en caso de que no se conecte con el servidor es probable que la version sea diferenete).


 1.El proyecto se abrirá en el navegador predeterminado de NetBeans, el cual mostrara la página inicial de la aplicación junto con las ligas a cada una de las consultas que podemos usar.
 
 
 2.En primer lugar tenemos “Consultar Multa” que nos llevara a la página para consultar una multa ya sea ingresando el “RFC” o las “Placas”, en cualquiera de los 2 solo ingresamos los datos solicitados y le damos click al botón “Buscar” lo cual nos dará en pantalla las multas que tenemos o avisarnos que no tenemos multas.


 La segunda liga es para consultar a los “Agentes” que tenemos dentro de la base de datos, la cual nos da información del agente como es el Id, RFC, y Sector.
 
 
 La tercera liga Nos da las multas levantadas por agente, dándonos el Id del agente, el sector, el artículo, municipio, estado de la multa y la hora en la que se hizo la multa.


 La liga de Multas por género nos da el género y el número de personas que han cometido alguna multa.
 
 
 Multas por edad no dice la edad y el número de personas que han cometido alguna multa.


La Liga de Multas por Modelo y Tipo nos da información del tipo de vehículo (Deportivo, convertible, hibrido entre otros), El modelo y el número de infracciones que se han cometido con esos tipos de vehículos.


 La liga de multas por hora nos da información del número de infracciones que se cometen en cada hora, este tipo de información puede ayudar a saber qué horas son las más problemáticas y que se implementen las precauciones debidas.


 Las multas por mes dan un resumen del número de multas que se cometieron en cada mes.


 La liga de multas por tipo de licencia, nos da un resumen del número de multas cometidas agrupadas por cada tipo de licencia (Tipo A, Tipo B, etc.)
                                                                                                                                                                     La liga de multas por estado lo que nos da es en nombre de cada estado y el número de infracciones que se han cometido en ese estado.


 La liga de “Registrar Persona” manda al usuario a una nueva página la cual le muestra un formulario el cual tiene que llenar con la información básica para poder agregar una persona a la base de datos de sistema de multas de CDMX , una vez llenado él formulario se tiene que dar click en el botón “Registrar” y te mostrara una nueva página con el mensaje de que se registró la persona y toda la información de la persona registrada si ese fue el caso de haber algún problema y que no pudo haber agregado a la persona saldrá un notificación de “No se registros”.
 
 
 La liga “Registrar Conductor” manda a una nueva página con un pequeño formulario de dos campos “RFC” y “tipo” en el cual para poder registra a un conductor éste tiene que estar previamente registrado en la base de datos, en el campo de “Tipo” solo se pone el tipo de la licencia si el procedimiento de registro es exitoso nos muestra un mensaje de que se registró conductor y la información del conductor de lo contrario si hubo algún problema y no lo pudo registrar no muestra un mensaje de “No se registró”.


 La liga “Registrar Agente” ésta liga manda a una nueva página la cual muestra una nueva página con un formulario de dos campos “RFC” y “Sector” en el cual para poder registrar un agente se necesita que ya este registrado en la base de datos y para el campo “Sector” se le asigna el sector en el que el agente trabajara, una vez llenado el formulario se le da click en Registrar, si la operación de registro fue exitosa nos muestra un mensaje de que se Registro el agente en caso contrario de que no se haya podido registrar el agente mostrara un mensaje de “Nos e pudo registrar”.


 La liga “Registrar Conductor” nos mande a una nueva página la cual tiene un formulario con la información básica para poder registrar un nuevo conductor de ser esta la primera vez de el registro, una vez llenado el formulario se dará click en el botón Registrar si los campos fueron llenados correctamente y no hubo ningún problema aparecerá un mensaje de Registro conductor y la información del conductor registrado, de no ser el caso nos mostrara un mensaje de “No se pudo registrar”


 La liga “ Registrar Vehículo “ nos manda a una nueva página la cual contiene un formulario con la información de vehículo y el RFC de el propietario al cual se registrara en la base datos, una vez llenado el formulario debemos dar click en el botón Registrar, si el proceso es éxitos se mostrara un mensaje de “Registro de Vehículo” y toda la información del vehículo registrado en caso contrario de no haber podido registrar el vehículo se mostrara un mensaje de “No se pudo registrar el vehículo”.


 La liga “Cambio Propietario” nos manda a una nueva página la cual tiene un pequeño formulario en donde nos pide el RFC del dueño anterior y el RFC de nuevo dueño las placas del vehículo y el estado en el cual se va a hacer el cambio, una vez llenado el formulario daremos click en el botón Siguiente si el cambio de propietario fue exitoso y la información sobre el cambio de propietario ; nos mostrara un mensaje de “Se hizo el propietario” de no haberse podido hacer el cambio nos mostrara un mensaje de “No se pudo realizar el cambio de propietario”.
 

La Liga “Registro de Tarjeta” nos manda a una nueva página la cual tiene un formulario con un campo el cual solo pide las placas del vehículo el cual ya tiene que estar registrado en la base de datos una vez escritas las placas y estas y están en la base de datos y nos genera un nueva tarjeta de circulación si es exitoso nos mostrara la información de la tarjeta de circulación de no ser así nos mostrara un mensaje de que “No se registró”.


La liga “Actualiza Tarjeta” nos manda a una nueva página la cuela tiene un formulario con un campo el cual nos pide el número de la tarjeta de circulación a la cual se debe de actualizar, si el número de la tarjeta sigue vigente o está en la base la información de la tarjeta se actualizara en caso contrario; si no se encuentra la tarjeta o no se puedo realizar la actualización mostrara un mensaje de no se puede actualizar la información.


 La liga “Genera Fotomulta” nos manda a una nueva página la cual contiene un formulario el cual nos pide el IdCamara , las placas del vehículo la velocidad a la que iba, la penalización que se ésta quebrantando y el importe a esa penalización una vez llenado el formulario se da click en el botón siguiente el cual genera la fotomulta y nos muestra la información se esta se generó correctamente de no ser así no manda un mensaje de “No se registró la multa”.


 La liga “Genera Multa” no manda a una nueva página la cual contiene un formulario para el llenado de la multa éste nos pide el número de registro personal del agente que impone la multa, la ubicación donde se realizó la infracción, el artículo que se quebrantó, el municipio, el número de la licencia del conductor y las placas del vehículo, una vez llenado el formulario se da click en el botón Siguiente si la multa se registró nos aparecerá la información de la multa de no ser registrada solo nos mostrara un mensaje de “No se registró Multa”.
 
 
 La liga “Pagar Multa” nos manda a una nueva página la cual contiene un pequeño formulario con un campo que nos pide el Id de la multa si la multa se encuentra en el sistema y no ésta pagada cambia el valor a pagado y nos manda un mensaje de multa pagada, si la multa no se encuentra no manda un mensaje de que “No se pudo realizar el pago”.


 La liga “Ver multa agente” nos manda a una nueva página la cual contiene un formulario de un campo que nos pide el Id del agente al cual queremos consultar si el Id del agente se encuentra registrado en la base de datos nos mostrara la información de las multas que a realizado, de no encontrar el Id del agente nos mostrara un mensaje que “No se pudo obtener la información”.
                                                                                                                                                                                                                                                                                                                                          La liga “Ver Fotomulta ” nos manda a una nueva página la cual contiene un formulario con un campo el cual nos pide le ID de la multa si la multa se encuentra registrada en la base de datos nos regresa la información de la multa, de no ser el caso nos mostrara un mensaje de “No se pudo obtener la información de la multa”.


 Cada liga tiene una liga llamada “Inicio” en la parte superior izquierda que al darle click nos llevara a la página principal de la aplicación.
                                                                               


##Verison
*JDK 6
*Glassfish 3.1.2




