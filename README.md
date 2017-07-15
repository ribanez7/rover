Un equipo de vehículos robot dirigidos por la NASA va a aterrizar en una
meseta en Marte.
La meseta, que, curiosamente, es rectangular, debe ser explorada por los
robots para que sus cámaras de abordo puedan obtener una imagen completa
del terreno circundante y así poder enviarlo a la tierra.
La posición y ubicación de un robot se representa mediante la combinación
de X e Y y una letra que representa a uno de los cuatro puntos cardinales.
La meseta se divide en una cuadrícula para simplificar la navegación.
Una posición de ejemplo podría ser 0, 0, N, significando ésta que el robot
se encuentra en la esquina inferior izquierda y orientado hacia el norte.
Para controlar a un robot, la NASA envía una simple cadena de letras.
Las letras posibles son 'L', 'R' y 'M'.
'L' y 'R' hacen que el robot gire 90 grados a la izquierda o a la derecha
respectivamente y sin moverse del lugar.
'M' significa avanzar una casilla manteniendo la orientación.

Assume that the square directly North from (x, y) is (x, y+1).

INPUT:

La primera línea del input son las coordenadas de la esquina superior
derecha de la meseta.
Las cordenadas de la esquina inferior-izquierda son 0,0.

El resto del input es información relativa a los robots que hay desplegados.
Cada robot tiene dos líneas de entrada. La primera da su posición. La segunda
son una serie de instrucciones diciéndole al robot cómo explorar la meseta.
La posición se compone de dos enteros y una letra separados por espacios.
Corresponden al valor x, y y orientación del robot.
Cada robot terminará secuencialmente. Esto significa que el segundo robot
no se empezará a mover hasta que el primero no haya terminado de moverse.


OUTPUT:

La salida de cada robot serán sus últimas coordenadas y su orientación.


INPUT AND OUTPUT:
Test Input:
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM

Expected Output:
1 3 N

















# Rover

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/rover`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rover'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rover

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rover.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
