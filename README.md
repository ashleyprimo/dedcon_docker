
# DedCon Docker Container
This is a fairly simple container created to allow you to effortlesly run [DedCon](http://dedcon.simamo.de/) (a dedicated server for the [DEFCON](https://en.wikipedia.org/wiki/DEFCON_(video_game)) game.)

**NOTE**: This was made very quickly and for fun...

## Security 
I am not the maintainer of DedCon, thus I am unable to give any guarantees on security, you should take appropriate precautions.
 
## How to get started
Simply, install docker and run `docker run --network host ashleyprimo/dedcon_docker:latest` (if you're using command line)

### Customization
In addition, this container supports some basic customization right out of the box (or advanced, if you wish to create your own config).

#### Environment Variable
| Environment Variable's | Use | Default |
|--|--|--|
| ServerName | Set's the Server's Name | DedCon Docker Server |
| ServerKey | Set's the Servers Key - (*this should be set to your game key- if you have purchased the game, this can be found when the game is launched under: Options -> Authentication*) | DEMOOF-MJSHVW-MOLIKG-FXIAFD-XQV |
| Welcome | Set a welcome message that will be displayed as people join the server | This is a simple Defcon Dedicated Server running using DedCon Docker. |
| AdvertisePlayers | If enabled (0 disabled, 1 enabled) this will advertise the usernames of the players connected to those not yet joined. | 1 |
| MaxTeams | Number of Players | 2 |
| RandomTerritories | If enabled (0 disabled, 1 enabled) this will randomly assign a territory to each player (instead of allowing them the option to choose)  | 1 |

To utilize one or more of these environment variables the run command would be something along the lines of `docker run --network host --env ServerName="Very Cool Server" ashleyprimo/dedcon_docker:latest`

#### Custom Configuations
It is also possible, as aluded too utilise your own custom config - this is simply done by mounting your configuration file to `/dedcon/config` on the server, for example `docker run --network host --mount type=bind,source="$(pwd)"/myConfig,target=/dedcon/config ashleyprimo/dedcon_docker:latest`

This example (on a `Linux`) machine will take a file named `myConfig` in your current working directory and mount it on the server in the correct location. **NOTE** the above mentioned environment variables will not be valid.

