
module FrontEnd.Tokens (
    Token(..),
    TokenConstruct(..),
    ) where

import FrontEnd.Utils -- Position


data Token = 
    TKbender          {pos :: Position}                    |
    TKof              {pos :: Position}                    |
    TKeternal         {pos :: Position}                    |

    TKis              {pos :: Position}                    |

    TKreincarnation   {pos :: Position}                    |

    TKart             {pos :: Position}                    |
    TKapprentice      {pos :: Position}                    |
    TKborn            {pos :: Position}                    |
    TKmember          {pos :: Position}                    |
    TKdied            {pos :: Position}                    |

    TKair             {pos :: Position}                    |
    TKwater           {pos :: Position}                    |
    TKfire            {pos :: Position}                    |
    TKlightning       {pos :: Position}                    |
    TKfireMaster      {pos :: Position}                    |
    TKearth           {pos :: Position}                    |
    TKmetal           {pos :: Position}                    |

    TKnation          {pos :: Position}                    |
    TKyear            {pos :: Position}                    |
    TKmasterOf        {pos :: Position}                    |
    TKdisciple        {pos :: Position}                    |
    
    TKelement         {pos :: Position}                    |
    TKmasteredBy      {pos :: Position}                    |
    TKlearning        {pos :: Position}                    |
    TKcontrol         {pos :: Position}                    |

    TKenergy          {pos :: Position}                    |
    TKallows          {pos :: Position}                    |
    TKtechniqueOf     {pos :: Position}                    |
    TKbending         {pos :: Position}                    |
    TKtechniquesFrom  {pos :: Position}                    |
    TKusing           {pos :: Position}                    |
    TKquotmark_s      {pos :: Position}                    |
    TKtechnique       {pos :: Position}                    |
    TKtrying          {pos :: Position}                    |

    TKbook            {pos :: Position}                    |
    TKabout           {pos :: Position}                    |
    TKtravel          {pos :: Position}                    |
    TKmadeBy          {pos :: Position}                    |

    TKandThen         {pos :: Position}                    |
    TKbut             {pos :: Position}                    |
    TKandThus         {pos :: Position}                    |
    TKbesides         {pos :: Position}                    |
    TKleft            {pos :: Position}                    |
    TKand             {pos :: Position}                    |
    TKor              {pos :: Position}                    |
    TKnot             {pos :: Position}                    |

    TKif              {pos :: Position}                    |
    TKotherwise       {pos :: Position}                    |

    TKint             {pos :: Position, numI :: Int}       |
    TKfloat           {pos :: Position, numF :: Float}     |

    TKcomma           {pos :: Position}                    |
    TKcolon           {pos :: Position}                    |
    TKbeginBlock      {pos :: Position}                    |
    TKendBlock        {pos :: Position}                    |
    TKdot             {pos :: Position}                    |
    TKunit            {pos :: Position}                    |
    TKopenParent      {pos :: Position}                    |
    TKcloseParent     {pos :: Position}                    |

    TKin              {pos :: Position}                    |
    TKbookWith        {pos :: Position}                    |

    TKwith            {pos :: Position}                    |

    TKlessThan        {pos :: Position}                    |
    TKlessEqThan      {pos :: Position}                    |
    TKgreaterThan     {pos :: Position}                    |
    TKgreaterEqThan   {pos :: Position}                    |
    TKequal           {pos :: Position}                    |

    TKwhile           {pos :: Position}                    |
    TKdoing           {pos :: Position}                    |

    TKopening         {pos :: Position}                    |
    TKchakrasFrom     {pos :: Position}                    |
    TKto              {pos :: Position}                    |

    TKchar            {pos :: Position, char  :: String}   |
    TKstring          {pos :: Position, str :: String}     |
    TKid              {pos :: Position, id  :: String}   

    deriving(Eq, Show)


type TokenConstruct = Position -> Token