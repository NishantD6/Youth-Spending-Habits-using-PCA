library(readr)
library(ggplot2)
library(dplyr)

responses <- read_csv("Desktop/Term 3/MVA/Final Project /Data/young-people-survey/responses.csv")
responses <- tbl_df(responses)
#View(responses)
glimpse(responses)
summary(factor(responses$demoGender))
# DATA CLEANING 
responses <- responses%>%
  select("musMusic" = Music,
         "musSlowOrFast"=`Slow songs or fast songs`,
         "musDance" = Dance,
         "musFolk" = Folk,
         "musCountry" = Country, 
         "musClassical" = `Classical music`,
         "musMusical" = Musical,
         "musPop" = Pop,
         "musRock" = Rock,
         "musMetal"=`Metal or Hardrock`,
         "musPunbk" = Punk, 
         "musHipHop"=`Hiphop, Rap`, 
         "musReggae" = `Reggae, Ska`, 
         "musJazz"=`Swing, Jazz`,
         "musRockNRoll"=`Rock n roll`,
         "musAlternative" = Alternative,
         "musLatino" = Latino, 
         "musTrance"=`Techno, Trance`,
         "musOpera" = Opera, 
         "movMovies" = Movies, 
         "movHorror" = Horror, 
         "movThiriller" = Thriller, 
         "movComedy" = Comedy, 
         "movRomantic" = Romantic, 
         "movSciFi"=`Sci-fi`,
         "movWar" = War, 
         "movFantasy"=`Fantasy/Fairy tales`,
         "movAnimated" = Animated, 
         "movDocumentary" = Documentary, 
         "movWestern" = Western, 
         "movAction" = Action, 
         "hobHistory" = History, 
         "hobPsychology" = Psychology, 
         "hobPolitics" = Politics, 
         "hobMathematics" = Mathematics, 
         "hobPhsycis" = Physics, 
         "hobInternet"=Internet, 
         "hobPC" = PC, 
         "hobEconomyMgmt"=`Economy Management`,
         "hobBiology"= Biology, 
         "hobChemistry"= Chemistry, 
         "hobReading" = Reading, 
         "hobGeography" = Geography, 
         "hobForeignLanguages"=`Foreign languages`, 
         "hobMedicine" = Medicine, 
         "hobLaw" = Law, 
         "hobCars" = Cars, 
         "hobArtExhibitions"=`Art exhibitions`, 
         "hobReligion" = Religion, 
         "hobOutdoors"=`Countryside, outdoors`, 
         "hobDancing" = Dancing, 
         "hobMusicalInstruments" = `Musical instruments` , 
         "hobWriting" = Writing, 
         "hobPassiveSports"=`Passive sport`,
         "hobActiveSports"=`Active sport`, 
         "hobGardening" = Gardening, 
         "hobCelebrities" = Celebrities, 
         "hobShopping" = Shopping, 
         "hobScienceTech"=`Science and technology`, 
         "hobTheatre" = Theatre, 
         "hobFunAndFriends"=`Fun with friends`,
         "hobAdrenalineSports"=`Adrenaline sports`, 
         "hobPets"= Pets, 
         "phoFlying"= Flying, 
         "phoStorm" = Storm, 
         "phoDarkness" = Darkness, 
         "phoHeights" = Heights, 
         "phoSpiders" = Spiders, 
         "phoSnakes" = Snakes, 
         "phoRats" = Rats, 
         "phoAgeing" = Ageing, 
         "phoDangerousDogs"=`Dangerous dogs`, 
         "phoublicSpeaking"=`Fear of public speaking`, 
         "heaSmoking"=Smoking, 
         "heaAlcohol"=Alcohol, 
         "heaHealthyEating"=`Healthy eating`, 
         "perDailyEvents"=`Daily events`,
         "perPrioritisingWorkload"=`Prioritising workload`,
         "perWritingNotes"=`Writing notes`,
         "perWorkaholism"= Workaholism, 
         "perThinkingAhead"=`Thinking ahead`, 
         "perFinalJudgement"=`Final judgement`,
         "perReliability" = Reliability, 
         "perKeepingPromises"=`Keeping promises`, 
         "perLossOfInterest"=`Loss of interest` ,
         "perFriendsVsMoney"=`Friends versus money` ,
         "perFunniness"=Funniness, 
         "perFake"=Fake, 
         "perCriminalDamage"=`Criminal damage`,
         "perDecisionMaking"=`Decision making` ,
         "perElections" = Elections, 
         "perSelfCriticism"=`Self-criticism` ,
         "perJudgementCalls"= `Judgment calls`,
         "perHypochondria" = Hypochondria, 
         "perEmpathy" = Empathy, 
         "perEatingToSurvive"=`Eating to survive`, 
         "perGiving" = Giving, 
         "perCompassionAnimals"=`Compassion to animals` , 
         "perBorrowedStuff"=`Borrowed stuff`, 
         "perLoneliness" = Loneliness, 
         "perCheatingInSchool"= `Cheating in school`,
         "perCheating" = Health, 
         "perChangingPast"=`Changing the past`, 
         "perGod" = God, 
         "perDreams" = Dreams, 
         "perCharity" = Charity, 
         "perNumberOfFriends"=`Number of friends`,
         "perPunctuality"= Punctuality, 
         "perLying"=Lying, 
         "perWaiting"=Waiting, 
         "perNewEnvironment"=`New environment`, 
         "perMoodSwings"=`Mood swings`, 
         "perAppearenceAndGestures"=`Appearence and gestures` , 
         "perSocializing"=Socializing, 
         "perAchievements"=Achievements, 
         "perRespondingToLetters"= `Responding to a serious letter` , 
         "perChildren" = Children, 
         "perAssertiveness"= Assertiveness, 
         "perGettingAngry"=`Getting angry` , 
         "perKnowningRightPeople"=`Knowing the right people` , 
         "perPublicSpeaking1"=`Public speaking`, 
         "perUnpopularity," = Unpopularity, 
         "perLifeStruggles"= `Life struggles`, 
         "perHappinessInLife"=`Happiness in life`, 
         "perEnergyLevels"=`Energy levels` ,
         "perSmallBigDogs"=`Small - big dogs`, 
         "perPersonality" = Personality, 
         "perFindingLostValuables"=`Finding lost valuables` , 
         "perGettingUp"=`Getting up` , 
         "perInterestsHobbies"=`Interests or hobbies`, 
         "perParentsAdvice"=`Parents' advice`,
         "perQtnrOrPolls"=`Questionnaires or polls`,
         "perInternetUsage"=`Internet usage`,
         "speFinances" = Finances, 
         "speShoppingCenters"=`Shopping centres`,
         "speBrandedClothing"=`Branded clothing`,
         "speEntertainmentSpending"=`Entertainment spending`,
         "speSpendingOnLooks"=`Spending on looks` ,
         "speSpendingOnGadgets"=`Spending on gadgets`,
         "speSpendingOnHealthyEating"=`Spending on healthy eating`,
         "demoAge"=Age, 
         "demoHeight" = Height, 
         "demoWeight" = Weight, 
         "demoNumOfSiblings"=`Number of siblings`, 
        "demoGender" = Gender, 
         "demoLeftOrRightHanded"=`Left - right handed`, 
        "demoEducation" = Education, 
        "demoOnlyChild"=`Only child`,
         "demoVillageOrTown"=`Village - town`,
         "demoHouseType"=`House - block of flats`
         )


responses$Smoking = factor(responses$Smoking, levels = c("never smoked", "tried smoking", "former smoker", "current smoker"))
responses$Alcohol = factor(responses$Alcohol, levels = c("never", "social drinker", "drink a lot"))
responses$Punctuality = factor(responses$Punctuality, levels = c("i am often early", "i am always on time", "i am often running late"))
responses$Lying = factor(responses$Lying, levels = c("never", "only to avoid hurting someone", "sometimes", "everytime it suits me"))
responses$Gender=as.factor(responses$Gender)
responses$LeftOrRightHanded=as.factor(responses$LeftOrRightHanded)
responses$Education = factor(responses$Education, levels = c("currently a primary school pupil", "primary school", "secondary school", "college/bachelor degree", "masters degree", "doctorate degree"))
responses$OnlyChild=as.factor(responses$OnlyChild)
responses$VillageOrTown=as.factor(responses$VillageOrTown)
responses$HouseType=as.factor(responses$HouseType)
responses$ InternetUsage=factor(responses$InternetUsage, levels = c("no time at all", "less than an hour a day", "few hours a day", "most of the day" ))

responses$Smoking <- as.numeric(responses$Smoking)
responses$Alcohol = as.numeric(responses$Alcohol)
responses$Punctuality = as.numeric(responses$Punctuality)
responses$Lying = as.numeric(responses$Lying)
responses$Gender=as.numeric(responses$Gender)
responses$LeftOrRightHanded=as.numeric(responses$LeftOrRightHanded)
responses$Education = as.numeric(responses$Education)
responses$OnlyChild=as.numeric(responses$OnlyChild)
responses$VillageOrTown=as.numeric(responses$VillageOrTown)
responses$HouseType=as.numeric(responses$HouseType)
responses$ InternetUsage=as.numeric(responses$InternetUsage)

glimpse(responses)


## CREATING SUB-BLOCKS FOR CFA
# DEMOGRAPHICS --- SUB BLOCK 1 

Demographics <- responses%>%
  select(Age:HouseType)
#glimpse(Demographics)

# SPENDING HABITS --- SUB BLOCK 2
spendingHabits <- responses%>%
  select(Finances:SpendingOnHealthyEating)
#glimpse(spendingHabits)

# PERSONALITY TRAITS --- SUB BLOCK 3
pTraits <- responses%>%
  dplyr::select(DailyEvents:InternetUsage)
glimpse(pTraits)

# PHOBIAS  - SUB BLOCK 4
phobias <- responses%>%
  select(Flying:PublicSpeaking)
#glimpse(phobias)

# Health Habits --- SUB BLOCK 5
healthHabits <- responses%>%
  select(Smoking:HealthyEating)
#glimpse(healthHabits)

# HOBBIES & INTERESTS  ---- SUB BLOCK 6
hobbies <- responses%>%
  select(History:Pets)
#glimpse(hobbies)

# MOVIE PREFERENCES ---- SUB BLOCK 7
movies <- responses%>%
  select(Movies:Action)
#glimpse(movies)

# MUSIC PREFERENCES ---- SUB BLOCK 8
music <- responses%>%
  select(Music:Opera)
#glimpse(music)


####PRINCIPLE COMPONENT ANALAYSIS
a <- pTraits%>%
  na.omit()
ev <- eigen(cor(a)) # get eigenvalues
ap <- parallel(subject=nrow(a),var=ncol(a),
               rep=100,cent=.05)
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS)

pTraits_Factors <- princomp(a, scores = T, cor=T)
summary(pTraits_Factors)
loadings(pTraits_Factors)

pTraits_Factors$loadings

biplot(pTraits_Factors)

pTraits_Factors$scores[1:10,]

factanal(a, factor=10)

write.csv(a, "personalitytraits.csv")


