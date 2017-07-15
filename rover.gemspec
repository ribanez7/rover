# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rover/version"

long_description = <<~EOF
A squad of robotic rovers are to be landed by NASA on a plateau on
Mars. This plateau, which is curiously rectangular, must be navigated
by the rovers so that their on-board cameras can get a complete
view of the surrounding terrain to send back to Earth.
A rover’s position and location is represented by a combination of x
and y co- ordinates and a letter representing one of the four cardinal
compass points. The plateau is divided up into a grid to simplify
navigation. An example position might be 0, 0, N, which means the
rover is in the bottom left corner and facing North.
In order to control a rover, NASA sends a simple string of letters. The
possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin
90 degrees left or right respectively, without moving from its current
spot. ‘M’ means move forward one grid point, and maintain the same
Heading.
 
Assume that the square directly North from (x, y) is (x, y+1).
 
INPUT:
The first line of input is the upper-right coordinates of the plateau, the
lower- left coordinates are assumed to be 0,0.
The rest of the input is information pertaining to the rovers that have
been deployed. Each rover has two lines of input. The first line gives
the rover’s position, and the second line is a series of instructions
telling the rover how to explore the plateau.
The position is made up of two integers and a letter separated by
spaces, corresponding to the x and y co-ordinates and the rover’s
orientation.
Each rover will be finished sequentially, which means that the
second rover won’t start to move until the first one has finished
Moving.
 
OUTPUT
The output for each rover should be its final co-ordinates and
heading.
INPUT AND OUTPUT
Test Input:
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
Expected Output:
1 3 N
5 1 E
EOF

Gem::Specification.new do |spec|
  spec.name          = "rover"
  spec.version       = Rover::VERSION
  spec.authors       = ["Rubén Ibáñez Carmona"]
  spec.email         = ["ruben.ibc@gmail.com"]

  spec.summary       = %q{Calculate where NASA rovers finished their job.}
  spec.description   = long_description
  spec.homepage      = "http://usr-bin-env.com/"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.4.0'
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
