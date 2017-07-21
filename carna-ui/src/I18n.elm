module I18n exposing (Locale(..), Key(..), t)

-- All translations for a given key


type Key
    = Age
    | Gender
    | GenderOptionMale
    | GenderOptionFemale
    | GenderOptionOther
    | Height
    | Weight
    | Waist
    | Hip
    | Chest
    | Subscapular
    | Armpit
    | Biceps
    | Triceps
    | Abdomen
    | IliacCrest
    | Thigh
    | Calf
    | CalculateBodyIndex
    | ValidationIsNotANumber
    | BodyIndexSurfaceArea
    | BodyIndexWaistHipRatio
    | BodyIndexResultColumnIndexName
    | BodyIndexResultColumnIndexValue
    | BodyIndexResultColumnIndexRating
    | BodyFatMethod3Folds
    | BodyFatMethod4Folds
    | BodyFatMethod7Folds
    | BodyFatMethod9Folds
    | InvalidResultContent
    | YourResultHeading
    | ContentHeadBMI
    | ContentSubheadBMI
    | ContentBodyBMI
    | ContentHeadCarna
    | ContentSubHeadCarna
    | ContentBodyCarna


type alias TranslationRecord =
    { german : String
    , english : String
    , french : String
    }


type Locale
    = DE
    | EN
    | FR


t : Locale -> Key -> String
t =
    translate


translate : Locale -> Key -> String
translate language key =
    let
        accessor =
            case language of
                DE ->
                    .german

                EN ->
                    .english

                FR ->
                    .french
    in
        knownTranslations key |> accessor


knownTranslations : Key -> TranslationRecord
knownTranslations key =
    case key of
        Age ->
            { german = "Alter"
            , english = "age"
            , french = "âge"
            }

        Weight ->
            { german = "Gewicht"
            , english = "weight"
            , french = "translationMissing"
            }

        Height ->
            { german = "Größe"
            , english = "height"
            , french = "translationMissing"
            }

        Waist ->
            { german = "Taille"
            , english = "waist"
            , french = "translationMissing"
            }

        Hip ->
            { german = "Hüftumfang"
            , english = "hip size"
            , french = "translationMissing"
            }

        Gender ->
            { german = "geschlecht"
            , english = "gender"
            , french = "translationMissing"
            }

        GenderOptionMale ->
            { german = "männlich"
            , english = "male"
            , french = "translationMissing"
            }

        GenderOptionFemale ->
            { german = "weiblich"
            , english = "female"
            , french = "translationMissing"
            }

        GenderOptionOther ->
            { german = "Sonstig"
            , english = "Other"
            , french = "translationMissing"
            }

        CalculateBodyIndex ->
            { german = "Body-Index berechnen"
            , english = "calculate body index"
            , french = "translationMissing"
            }

        InvalidResultContent ->
            { german = "Konnte nicht berechnet werden"
            , english = "invalid calculation result"
            , french = "translationMissing"
            }

        BodyIndexSurfaceArea ->
            { german = "BSA"
            , english = "BSA"
            , french = "translationMissing"
            }

        BodyIndexWaistHipRatio ->
            { german = "waist-hip ratio"
            , english = "waist-hip ratio"
            , french = "translationMissing"
            }

        BodyIndexResultColumnIndexName ->
            { german = "Body-Index"
            , english = "body-index"
            , french = "translationMissing"
            }

        BodyIndexResultColumnIndexValue ->
            { german = "Ergebnis"
            , english = "your result"
            , french = "translationMissing"
            }

        BodyIndexResultColumnIndexRating ->
            { german = ""
            , english = ""
            , french = ""
            }

        BodyFatMethod3Folds ->
            { german = "3 Falten"
            , english = "3 folds"
            , french = "translationMissing"
            }

        BodyFatMethod4Folds ->
            { german = "4 Falten"
            , english = "4 folds"
            , french = "translationMissing"
            }

        BodyFatMethod7Folds ->
            { german = "7 Falten"
            , english = "7 folds"
            , french = "translationMissing"
            }

        BodyFatMethod9Folds ->
            { german = "9 Falten"
            , english = "9 folds"
            , french = "translationMissing"
            }

        Chest ->
            { german = "Brust"
            , english = "chest"
            , french = "translationMissing"
            }

        Subscapular ->
            { german = "Schulterblatt"
            , english = "shoulderblade"
            , french = "translationMissing"
            }

        Armpit ->
            { german = "Achsel"
            , english = "armpit"
            , french = "translationMissing"
            }

        Biceps ->
            { german = "Bizeps"
            , english = "biceps"
            , french = "translationMissing"
            }

        Triceps ->
            { german = "Triceps"
            , english = "triceps"
            , french = "translationMissing"
            }

        Abdomen ->
            { german = "Abdomen"
            , english = "abdomen"
            , french = "translationMissing"
            }

        IliacCrest ->
            { german = "Hüfte (Iliac Crest)"
            , english = "hip (iliac crest)"
            , french = "translationMissing"
            }

        Thigh ->
            { german = "Oberschenkel"
            , english = "thigh"
            , french = "translationMissing"
            }

        Calf ->
            { german = "Wade"
            , english = "calf"
            , french = "translationMissing"
            }

        YourResultHeading ->
            { german = "Ergebnis"
            , english = "Your results"
            , french = "translationMissing"
            }

        ContentHeadBMI ->
            { german = "BMI - Body Mass Index"
            , english = "BMI - Body Mass Index"
            , french = "BMI - Body Mass Index"
            }

        ContentSubheadBMI ->
            { german = "Zum BMI"
            , english = "About BMI"
            , french = "translationMissing"
            }

        ContentBodyBMI ->
            { german = "Hier geht es um den BMI."
            , english = "BMI is awesome, so lets be happy"
            , french = "translationMissing"
            }

        ContentHeadCarna ->
            { german = "Carna - Body Index"
            , english = "Carna - Body Index"
            , french = "Carna - Body Index"
            }

        ContentSubHeadCarna ->
            { german = "Carna ermöglicht diverse Körper-Index Berechnungen"
            , english = "Carna lets you calculate many body indexes"
            , french = "translationMissing"
            }

        ContentBodyCarna ->
            { german = """
        Mit dem Body-Index-Rechner den ist es möglich den Körperfettanteil,
        den BMI (nach WHO),  den BAI (Body Adiposity Index),
        das Idealgewicht nach Broca index, den Ponderal-Index,
        das Taille-Hüft-Verhältnis und die Körperoberfläche (nach DuBois) zu berechnen.
        """
            , english = """
        With our body index calculator, you can measure your body-fat percentage, the BMI (according to WHO),
        the BAI (Body Adiposity Index),
        your ideal weight (Broca index), your Ponderal-Index,
        your waist-hip-ratio and your body surface area (according to DuBois).
        """
            , french = "translationMissing"
            }

        _ ->
            { german = "translationMissing"
            , english = "translationMissing"
            , french = "translationMissing"
            }
