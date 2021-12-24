// Nishant  & Ned 
// Final Project - Do file
// Multivariate Analysis 
// MRM - IESE Nisomess School
// 16th Jan 2019


clear all
use "/Users/Home/MVAFinal_RtoStata.dta", clear // import the file here


//FACTOR ANALYSIS
//Extrovert
factor perDailyEvents perWorkaholism perFriendsVsMoney perFake perSelfCriticism perLoneliness perCheating perNumberOfFriends perLying perAppearenceAndGestures perSocializing perAchievements perAssertiveness perKnowningRightPeople perPublicSpeaking1 perEnergyLevels perHappinessInLife perPrioritisingWorkload perThinkingAhead perReliability perKeepingPromises perHypochondria perEmpathy perCharity perNewEnvironment perGettingAngr, blank(0.4)
fapara, reps(25) 
loadingplot
//rotate
estat common

//Aggressive Moviels
factor mov*, mineigen(1.0) blank(0.4)
rotate
estat common
fapara, reps(25) 

//Spending Habits
factor speShoppingCenters speBrandedClothing speEntertainmentSpending speSpendingOnLooks speSpendingOnGadgets speSpendingOnHealthyEating, mineigen(1.0) blank(0.4)
rotate
estat common
fapara, reps(25) 

 
//SEM AGG.MOV-> Extrovet -> SpendingHabits

sem (Extro ->perNumberOfFriends perNewEnvironment perSocializing perHappinessInLife perEnergyLevels) (Agrmov->Extro) (Agrmov  -> movThiriller movWar movWestern movAction movHorror movSciFi ) (Extro-> Spend) (Spend -> speShoppingCenters speBrandedClothing speEntertainmentSpending speSpendingOnLooks speSpendingOnGadgets), stand  cov(e.movThiriller*e.movHorror)  cov(e.speShoppingCenters*e.speSpendingOnLooks)  cov(e.perNewEnvironment*e.perSocializing)
estat gof, stats(all)
estat mindices

  
//Moderation effect with Gender

sem (Extro ->perNumberOfFriends perNewEnvironment perSocializing perHappinessInLife perEnergyLevels) (Agrmov->Extro) (Agrmov  -> movThiriller movWar movWestern movAction movHorror movSciFi ) (Extro-> Spend) (Spend -> speShoppingCenters speBrandedClothing speEntertainmentSpending speSpendingOnLooks speSpendingOnGadgets), stand  cov(e.movThiriller*e.movHorror)  cov(e.speShoppingCenters*e.speSpendingOnLooks)  cov(e.perNewEnvironment*e.perSocializing)
estat gof, stats(all)
*get all fit statistics
estat gof, stats(all)
*get group level fit statistics
estat ggof
*get indirect effect estimates
estat teffects, nodirect nototal compact
*tests for group invariance of parameters
estat ginvariant

  
