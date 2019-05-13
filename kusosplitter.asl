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
    return current.levelID > 2 && current.levelID < 43 ;
} 

split{
    return ((current.levelID - old.levelID == 1) || ((old.levelID < 60) && (current.levelID >= 60)));
}

 reset{
return (current.levelID == 2) || (current.frames < old.frames);
} 
