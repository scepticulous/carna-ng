module BodyIndexClassification exposing (Classification(..), classifyBMI, classifyBAI, classifyBrocaIndex, classifyPonderalIndex)

import List.Extra as ListExtra
import Maybe
import Utils exposing (Gender(..))


{-|


# Surface Area

average values:
general: 1,7 m².
men: 1,9 m².
women: 1,6 m²
12year: 1,33 m²

      def average_value
        if @measurement.age<=12
          1.33
        else
          if @measurement.female?
            1.6
          else
            1.9
          end
        end
      end

      def lower_border(value)
        value*0.8
      end

      def upper_border(value)
        value*1.2
      end

-}
type Classification
    = Good (Maybe String)
    | Bad (Maybe String)
    | VeryBad (Maybe String)


type alias BodyIndexRange =
    { start : Float
    , end : Float
    , class : Classification

    -- , text : String
    }


{-| BMI
starkes Untergewicht < 16,00 Untergewicht
mäßiges Untergewicht 16,0 – < 17
leichtes Untergewicht 17,0 – < 18,5
Normalgewicht 18,5 – < 25 Normalgewicht
Präadipositas 25,0 – < 30 Übergewicht
Adipositas Grad I 30,0 – < 35 Adipositas
Adipositas Grad II 35,0 – < 40
Adipositas Grad III ≥ 40,0
THRESHOLDS=[15,18.5,25,30]
CLASSIFICATIONS=[:lower_critical,:lower_warning,:normal,:upper_warning,:upper_critical]
-}
bmiRanges : List BodyIndexRange
bmiRanges =
    [ { start = 0, end = 16, class = VeryBad Nothing }
    , { start = 16, end = 17, class = Bad Nothing }
    , { start = 17, end = 18.5, class = Bad Nothing }
    , { start = 18.5, end = 25, class = Good Nothing }
    , { start = 25, end = 30, class = Bad Nothing }
    , { start = 30, end = 35, class = VeryBad Nothing }
    , { start = 35, end = 40, class = VeryBad Nothing }
    , { start = 40, end = 1000, class = VeryBad Nothing }
    ]


classifyBMI : Float -> Maybe Classification
classifyBMI bmi =
    let
        match =
            ListExtra.find (\r -> bmi >= r.start && bmi < r.end) bmiRanges
    in
        case match of
            Just rec ->
                Just rec.class

            Nothing ->
                Nothing


{-|


## note about only fitting average hight values?

weight=self.broca_index(measurement) // height - 100
if measurement.female?
BodyIndexCalculator.trim_result(weight*0.8+age_offset(measurement.age))
else
BodyIndexCalculator.trim_result(weight*0.9+age_offset(measurement.age))
end

-}
classifyBrocaIndex : Float -> Classification
classifyBrocaIndex bi =
    let
        -- range =
        --     [ { start = 0, end = bi * 0.95, class = Bad Nothing }
        --     , { start = bi * 0.95, end = bi * 1.05, class = Neutral Nothing }
        --     , { start = bi * 1.05, end = 1000, class = Good Nothing }
        --     ]
        ( lower, upper ) =
            ( bi * 0.95, bi * 1.05 )
    in
        if bi < lower then
            Bad (Just "Too low")
        else if bi >= lower && bi < upper then
            Good (Just "Ideal")
        else
            Bad (Just "Too high")


classifyBAI : Float -> Maybe Int -> Gender -> Classification
classifyBAI bai age gender =
    case gender of
        Female ->
            classifyBAIFemale bai

        _ ->
            classifyBAIMale bai


{-| BAI

BAI Male 20 to 40
Underweight < 8%
Healthy 8 to 19%
Overweight 19 to 25%
Obese > 25%

-}
classifyBAIMale : Float -> Classification
classifyBAIMale bai =
    if bai < 8 then
        Bad (Just "Too low")
    else if bai >= 8 && bai < 19 then
        Good Nothing
    else if bai >= 19 && bai < 25 then
        Bad (Just "Too high")
    else
        VeryBad (Just "potentially obese")


{-| BAI

BAI Female 20 to 40
Underweight < 21%
Healthy 21 to 33%
Overweight 33 to 39%
Obese > 39%

-}
classifyBAIFemale : Float -> Classification
classifyBAIFemale bai =
    if bai < 1 then
        Bad (Just "Too low")
    else if bai >= 21 && bai < 33 then
        Good Nothing
    else if bai >= 33 && bai < 39 then
        Bad (Just "Too high")
    else
        VeryBad (Just "potentially obese")


classifyPonderalIndex : Float -> Classification
classifyPonderalIndex bi =
    let
        ( lower, upper ) =
            ( 11, 14 )
    in
        if bi < lower then
            Bad (Just "Too low")
        else if bi >= lower && bi < upper then
            Good (Just "Ideal")
        else
            Bad (Just "Too high")
