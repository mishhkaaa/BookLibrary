import 'package:flutter/material.dart';

class GenresTabContent extends StatelessWidget {
  const GenresTabContent({super.key, required double height});

  @override
  Widget build(BuildContext context) {
    // Sample data for genres and books with image URLs
    final genres = {
      'Science Fiction': [
        {
          'title': 'Dune',
          'image':
              'https://th.bing.com/th/id/OIP.cvoSdGRO8TtT-zw5N0qAAQHaLL?w=182&h=275&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Neuromancer',
          'image':
              'https://th.bing.com/th/id/OIP.VkEuRLvIGkzMLRn7U5WgSQHaLU?w=182&h=278&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Ender’s Game',
          'image':
              'https://upload.wikimedia.org/wikipedia/en/thumb/e/e4/Ender%27s_game_cover_ISBN_0312932081.jpg/220px-Ender%27s_game_cover_ISBN_0312932081.jpg'
        },
        {
          'title': 'The Left Hand of Darkness',
          'image':
              'https://m.media-amazon.com/images/I/71YEAnV8XTL._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'Snow Crash',
          'image':
              'https://th.bing.com/th/id/OIP.60dZU9qEoBBCxHJIuOtRkwHaLF?w=182&h=272&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Foundation',
          'image':
              'https://m.media-amazon.com/images/I/81J4LjdqQFL._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'Hyperion',
          'image':
              'https://th.bing.com/th/id/OIP.mQ59rpCxFK5q6u3uYu0cpAHaLH?w=182&h=273&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Martian',
          'image':
              'https://th.bing.com/th/id/OIP.ehkQ8LDmazUmonj52Fdb4QHaLQ?w=182&h=278&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Brave New World',
          'image':
              'https://m.media-amazon.com/images/I/81zE42gT3xL._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'The War of the Worlds',
          'image':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCrDFgm6YeuRtwgFn9dHy4iR8bYi-_fVloCQ&s'
        }
      ],
      'Fantasy': [
        {
          'title': 'The Hobbit',
          'image':
              'https://th.bing.com/th/id/OIP.Js66vo-tf_LwdF3p4PegQQHaLX?w=182&h=280&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Harry Potter and the Sorcerer’s Stone',
          'image':
              'https://th.bing.com/th/id/OIP.bxANBol8UouhsbTDmiNGiQHaLL?w=182&h=275&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'A Game of Thrones',
          'image':
              'https://th.bing.com/th/id/OIP.0P0XcZC7ZqCelqAafkMh6wHaLe?w=182&h=283&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Name of the Wind',
          'image':
              'https://th.bing.com/th/id/OIP.Zcj7ak_heLLzcsa1syUGqAHaLY?w=182&h=280&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Mistborn: The Final Empire',
          'image':
              'https://th.bing.com/th/id/OIP.9BRxyipDFPrRQoosNLln6AHaLG?w=182&h=273&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Lies of Locke Lamora',
          'image':
              'https://th.bing.com/th/id/OIP.dtOxmrPmWkTXJBsDPB26zwAAAA?w=121&h=199&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Way of Kings',
          'image':
              'https://th.bing.com/th/id/OIP.ntsbhKDmAttn-Qd2twageAHaMK?w=182&h=299&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Golden Compass',
          'image':
              'https://m.media-amazon.com/images/I/91N2rwc+NRL._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'American Gods',
          'image':
              'https://m.media-amazon.com/images/I/716LpMKQ3iL._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'Eragon',
          'image':
              'https://th.bing.com/th/id/OIP.NvT1KfXhYmIoXU48xi5eZwHaLX?w=182&h=280&c=7&r=0&o=5&pid=1.7'
        }
      ],
      'Mystery': [
        {
          'title': 'The Girl with the Dragon Tattoo',
          'image':
              'https://m.media-amazon.com/images/I/61Qs-hoZ-TL._AC_UF350,350_QL50_.jpg'
        },
        {
          'title': 'Gone Girl',
          'image':
              'https://th.bing.com/th/id/OIP.kjfa82Oe12PHIvsVxMwVNAHaLW?w=182&h=280&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Big Little Lies',
          'image':
              'https://th.bing.com/th/id/OIP.vA8tpvEtqjp02kyKboxyIQHaLH?w=182&h=273&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'In the Woods',
          'image':
              'https://th.bing.com/th/id/OIP.4ukU2JvKyM5Isr4vvHltMAAAAA?w=182&h=281&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Da Vinci Code',
          'image':
              'https://th.bing.com/th/id/OIP.vZSBs8BZmP27ex_Em6Hz7wHaLj?w=182&h=284&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Silent Patient',
          'image':
              'https://th.bing.com/th/id/OIP.uUMCez97vxzU06pdu97EXQHaLW?w=117&h=180&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Before I Go to Sleep',
          'image':
              'https://m.media-amazon.com/images/I/81SFYne3dWL._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'Sharp Objects',
          'image':
              'https://m.media-amazon.com/images/I/71yrp7aLK3L._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'The Woman in the Window',
          'image':
              'https://th.bing.com/th/id/OIP.huWyBgwkVbzt5aYDvTCPXQHaLZ?w=182&h=281&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Secret History',
          'image':
              'https://th.bing.com/th/id/OIP.2qqNWeux-2AOajh54xI_ZgHaL2?w=122&h=195&c=7&r=0&o=5&pid=1.7'
        }
      ],
      'Romance': [
        {
          'title': 'Pride and Prejudice',
          'image':
              'https://th.bing.com/th/id/OIP.k03AOvBfNEEWH-97vkRliQHaLX?w=182&h=280&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Outlander',
          'image':
              'https://th.bing.com/th/id/OIP.8aR13NYNWNHV4ZcEVyTe0gHaLU?w=182&h=278&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Notebook',
          'image':
              'https://th.bing.com/th/id/OIP.aphP_a3mbADV5dmxGOEGvQAAAA?w=182&h=298&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Me Before You',
          'image':
              'https://th.bing.com/th/id/OIP.hIcB49R96tAF16nJijRC_AHaLX?w=122&h=189&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Rosie Project',
          'image':
              'https://th.bing.com/th/id/OIP.sW_YBaHZ6CL7rImmZD1_kwHaLC?w=117&h=180&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Kiss Quotient',
          'image':
              'https://th.bing.com/th/id/OIP.YgRk9ddKkiem_CkdxB9YOgHaLG?w=115&h=180&c=7&r=0&o=5&pid=1.7g'
        },
        {
          'title': 'To All the Boys I’ve Loved Before',
          'image':
              'https://th.bing.com/th/id/OIP.6utzS0MwFpb6MFJA_jFPNgHaLZ?w=123&h=190&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Hating Game',
          'image':
              'https://th.bing.com/th/id/OIP.q5sfo8DfyufXKZPhwg9_2QHaHc?w=182&h=183&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Beautiful Disaster',
          'image':
              'https://m.media-amazon.com/images/I/811syzHqj8L._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'Red, White & Royal Blue',
          'image':
              'https://th.bing.com/th/id/OIP.AK_3qYmDbexLlkdBLRmFEwAAAA?w=121&h=185&c=7&r=0&o=5&pid=1.7'
        }
      ],
      'Historical Fiction': [
        {
          'title': 'All the Light We Cannot See',
          'image':
              'https://m.media-amazon.com/images/I/81RBTG28sCL._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'The Book Thief',
          'image':
              'https://m.media-amazon.com/images/I/91JGwQlnu7L._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'The Nightingale',
          'image':
              'https://m.media-amazon.com/images/I/81CpbNL0IeL._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'The Alice Network',
          'image':
              'https://th.bing.com/th/id/OIP.g2juffcngQDD78ghq94fugHaJ4?w=115&h=180&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Goldfinch',
          'image':
              'https://th.bing.com/th/id/OIP.u4qhcoOByqKNYb-y9BE_WwHaLe?w=115&h=180&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Paris Library',
          'image':
              'https://th.bing.com/th/id/OIP.JFOpzfMblDTxfHk50M-zKAHaLg?w=115&h=180&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Where the Crawdads Sing',
          'image':
              'https://th.bing.com/th/id/OIP.5eWwnd3a16D-Yzyb9EPn8wHaLL?w=182&h=275&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Atonement',
          'image':
              'https://m.media-amazon.com/images/I/71FLfI1DP1L._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'The Guernsey Literary and Potato Peel Pie Society',
          'image':
              'https://m.media-amazon.com/images/I/81rC7miqI8L._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'The Tattooist of Auschwitz',
          'image':
              'https://th.bing.com/th/id/OIP.VQUY-7SEGERVddliZeQ9UQHaLM?w=131&h=198&c=7&r=0&o=5&pid=1.7'
        }
      ],
      'Thriller': [
        {
          'title': 'The Girl on the Train',
          'image':
              'https://th.bing.com/th/id/OIP.G1KsoMdqpN0EnCBx0oDhugHaMB?w=184&h=299&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Woman in Cabin 10',
          'image':
              'https://th.bing.com/th/id/OIP.J8tX7AzfkgrX676YB7Z4oQHaLM?w=115&h=180&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Couple Next Door',
          'image':
              'https://th.bing.com/th/id/OIP.YhERDvPW3bu_P0UzYK13lAHaLU?w=115&h=180&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Girl Before',
          'image':
              'https://th.bing.com/th/id/OIP.7PYw4nqqaJeEuuUJbHuOLwHaLe?w=120&h=186&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Behind Closed Doors',
          'image':
              'https://th.bing.com/th/id/OIP.JEHdJBFnyQ0j1HBS49_xCAHaJ4?w=184&h=245&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Ice Princess',
          'image':
              'https://th.bing.com/th/id/OIP.MhwS7l6ts3z2kMDdq_R8UwHaLY?w=184&h=283&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Last Mrs. Parrish',
          'image':
              'https://th.bing.com/th/id/OIP.FMURbw85amUTMLtWSF2UwQHaLS?w=131&h=199&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Silent Corner',
          'image':
              'https://th.bing.com/th/id/OIP.2d9OAOhsRZOyX4PfZrOi-AHaLZ?w=184&h=284&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Woman in the Window',
          'image':
              'https://th.bing.com/th/id/OIP.huWyBgwkVbzt5aYDvTCPXQHaLZ?w=184&h=284&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Perfect Girl',
          'image':
              'https://th.bing.com/th/id/OIP.RsgvV_de-iIu80XwkH7TrAAAAA?w=184&h=281&c=7&r=0&o=5&pid=1.7'
        }
      ],
      'Horror': [
        {
          'title': 'It',
          'image':
              'https://th.bing.com/th/id/OIP.TrAsGhUzwtog6MwIHfUzOAHaLL?w=184&h=278&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Shining',
          'image':
              'https://m.media-amazon.com/images/I/815Uhzxve5L._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'Dracula',
          'image':
              'https://th.bing.com/th/id/OIP.4DH5mCZDvvimIYRURCtngwHaL8?w=184&h=298&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Frankenstein',
          'image':
              'https://m.media-amazon.com/images/I/71hCBEMpQ0L._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'Bird Box',
          'image':
              'https://m.media-amazon.com/images/I/91jBfwPCeKL._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'The Haunting of Hill House',
          'image':
              'https://th.bing.com/th/id/OIP.eUvPR-bRsf64-SbASw8RiQHaJ4?w=184&h=245&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Exorcist',
          'image':
              'https://th.bing.com/th/id/OIP.p6vaZFFEozUqSJsw_hdWhQHaLQ?w=184&h=281&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Pet Sematary',
          'image':
              'https://th.bing.com/th/id/OIP.WwF3H3hKLCABzGfvn_0RSwHaNb?w=115&h=185&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Amityville Horror',
          'image':
              'https://th.bing.com/th/id/OIP.iu8Y1CWhxzm1B12C2i3wSwHaL9?w=184&h=298&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Hell House',
          'image':
              'https://th.bing.com/th/id/OIP.CGWO0Qao9ZSQn8ybFucm3QHaLO?w=184&h=278&c=7&r=0&o=5&pid=1.7'
        }
      ],
      'Biography': [
        {
          'title': 'Becoming',
          'image':
              'https://th.bing.com/th/id/OIP._Yhb253a91_FCfaQPfmDDAHaLQ?w=115&h=180&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Steve Jobs',
          'image':
              'https://th.bing.com/th/id/OIP.zvG9Yx7dDPsmWabttjTzQQHaLh?w=115&h=180&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Diary of a Young Girl',
          'image':
              'https://th.bing.com/th/id/OIP.ZK440LfpcTG8kUx1alypggHaMF?w=184&h=301&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Educated',
          'image':
              'https://th.bing.com/th/id/OIP.xPYJlYSlnGVIM1j1ZcFNzQHaLX?w=122&h=188&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'When Breath Becomes Air',
          'image':
              'https://th.bing.com/th/id/OIP.sr28HveYWoE27DYXF_cP0gHaJ4?w=130&h=180&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Glass Castle',
          'image':
              'https://m.media-amazon.com/images/I/71td5GDUZML._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'Long Walk to Freedom',
          'image':
              'https://m.media-amazon.com/images/I/91jMa+ndqrL._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'The Immortal Life of Henrietta Lacks',
          'image':
              'https://th.bing.com/th/id/OIP.mvbxBqzMaR3UY_IYzRwWeAHaNB?w=184&h=324&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Into the Wild',
          'image':
              'https://th.bing.com/th/id/OIP.Rdk7oe185xRMZ1eXSIKgKQAAAA?w=184&h=268&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'I Am Malala',
          'image':
              'https://m.media-amazon.com/images/I/811pl5hIebL._AC_UF1000,1000_QL80_.jpg'
        }
      ],
      'Self-Help': [
        {
          'title': 'The Subtle Art of Not Giving a F*ck',
          'image':
              'https://th.bing.com/th/id/OIP.TWMnl4iUQ04N9KAwMhU4PAHaJ4?w=132&h=180&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Atomic Habits',
          'image':
              'https://th.bing.com/th/id/OIP.40YdU1lR2EQdFRfSxnTERQHaHa?w=184&h=184&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'How to Win Friends and Influence People',
          'image':
              'https://th.bing.com/th/id/OIP.5tK5CUws8e079Nz7tJZsLAHaLb?w=184&h=284&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Think and Grow Rich',
          'image':
              'https://th.bing.com/th/id/OIP.TLGlvEeTAK-T7TOKuPReCgHaJl?w=184&h=239&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The 7 Habits of Highly Effective People',
          'image':
              'https://m.media-amazon.com/images/I/71Koyhv2bML._AC_UF1000,1000_QL80_.jpg'
        },
        {
          'title': 'You Are a Badass',
          'image':
              'https://th.bing.com/th/id/OIP.kGDbVw_3QO7J8A3FGbp5VgHaLX?w=115&h=180&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Daring Greatly',
          'image':
              'https://th.bing.com/th/id/OIP.0BBG1BK0robyU0rGxn09QgHaLX?w=122&h=187&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Grit',
          'image':
              'https://th.bing.com/th/id/OIP.dxGs91Cx7hX2yGJJEvisrAHaLL?w=184&h=278&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Four Agreements',
          'image':
              'https://th.bing.com/th/id/OIP.fl2wdCVp8CP-xTLAacgVNQAAAA?w=115&h=181&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Start with Why',
          'image':
              'https://th.bing.com/th/id/OIP.X31dfBXg9yupWC0B1TjICAHaHa?w=171&h=180&c=7&r=0&o=5&pid=1.7'
        }
      ],
      'Young Adult': [
        {
          'title': 'The Hunger Games',
          'image':
              'https://th.bing.com/th/id/OIP.S0qQ8zdSHnFSzr-14H0KnAHaLR?w=184&h=281&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Fault in Our Stars',
          'image':
              'https://th.bing.com/th/id/OIP.-xBAgMNbnILBnZLA_O4eMAHaLf?w=184&h=286&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Looking for Alaska',
          'image':
              'https://th.bing.com/th/id/OIP.qgZeJJK8UYTuA_IS2r8yFwHaLT?w=184&h=281&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Eleanor & Park',
          'image':
              'https://th.bing.com/th/id/OIP.SOHNNr59_mI-vekStDNANQHaJ5?w=184&h=246&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Miss Peregrine’s Home for Peculiar Children',
          'image':
              'https://th.bing.com/th/id/OIP.lhVA5bMXcY2Rl8SZ9WxpWAHaLs?w=184&h=292&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Divergent',
          'image':
              'https://th.bing.com/th/id/OIP.73fSK6BhFsgmVjybQrWwlAHaHa?w=184&h=184&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Thirteen Reasons Why',
          'image':
              'https://rukminim2.flixcart.com/image/850/1000/kufuikw0/book/x/f/3/thirteen-reasons-why-original-imag7jh9ryembnjy.jpeg?q=20&crop=false'
        },
        {
          'title': 'The Maze Runner',
          'image':
              'https://th.bing.com/th/id/OIP.ASNlUhmbatYODIa7EQznBwHaJ4?w=184&h=245&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'The Perks of Being a Wallflower',
          'image':
              'https://th.bing.com/th/id/OIP.n4mHSZgGraCmOvnYntwxKwHaLR?w=184&h=281&c=7&r=0&o=5&pid=1.7'
        },
        {
          'title': 'Wonder',
          'image':
              'https://th.bing.com/th/id/OIP.yjHPjmMUSjNxYUwcBjSiXgHaLW?w=184&h=283&c=7&r=0&o=5&pid=1.7'
        }
      ],
    };

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: genres.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Genre Title
                Text(
                  entry.key,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // Horizontal Book List
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: entry.value.length,
                    itemBuilder: (context, index) {
                      final book = entry.value[index];
                      return GestureDetector(
                        onTap: () {
                          // Handle book selection
                        },
                        child: Container(
                          width: 150,
                          margin: const EdgeInsets.only(right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container for Book Cover Image
                              Container(
                                height: 200,
                                width: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(book['image'] ?? ''),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 6,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Container for Book Title
                              Container(
                                height: 32,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  book['title'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow:
                                      TextOverflow.ellipsis, // Add this line
                                  maxLines: 2, // Add this line
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 32), // Space between sections
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
