state("kuso") {
    double frames : 0x4B2758, 0x2C, 0x10, 0x1E0, 0x30;
    int levelID : 0x6C2D90; 
}

gameTime {
    return TimeSpan.FromSeconds(current.frames / 60.0);
}

isLoading {
    return true; // always pause game time
}

start{
    //Main menu is level ID 2, 3-18 is LOVE, 19-43 is kuso
    //Timer should start if you're in a level at all
    return current.levelID > 2 && current.levelID < 44 ;
} 

split{
    //60 is the ID for the menu for the end of full level runs
    //61 is the ID for the menu for the end of a single level
    //We either split on level progression or if we hit that right sort of menu
    return ((current.levelID - old.levelID == 1) || ((old.levelID < 60) && (current.levelID >= 60)));
}

reset{
    //Resetting constantly in the main menu is not only funny, it's practical
    //The other way is if a reset is initiated
    return (current.levelID == 2) || (current.frames < old.frames);
} 
