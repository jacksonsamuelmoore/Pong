#include "stdafx.h"
#include <windows.h>
#include <cstdlib>
#include <ctime>

int main(){
    sf::RenderWindow mainWindow;
    mainWindow.create(sf::VideoMode(600,600), "Pong!", sf::Style::Close | sf::Style::Resize);
    mainWindow.setFramerateLimit(60);
    sf::Image window_icon;
    window_icon.loadFromFile("icon.png");
    mainWindow.setIcon(window_icon.getSize().x, window_icon.getSize().y, window_icon.getPixelsPtr());
    
    

    bool menu = true;
    

    int timer = 0;
    float velocity = 1;
    int score = 0;

    sf::Texture ballMap;
    sf::Texture paddleMap;
    ballMap.loadFromFile("circle.png" );
    paddleMap.loadFromFile("paddle.png");
    
    sf::CircleShape ball(16);
    ball.setFillColor(sf::Color::Black);
    ball.setPosition(mainWindow.getSize().x/2,mainWindow.getSize().y/2);


    srand((int)time(0));
    sf::Vector2f direction(rand() % 5,rand() % 5);
    sf::Sprite paddle1;
    paddle1.setTexture(paddleMap);
     
    sf::Font font;
    font.loadFromFile("consolas.ttf");
    sf::Text play("Play", font, 150);
    play.setPosition(50,20);
    sf::Text exit_game("Exit", font, 150);
    exit_game.setPosition(50, 300);
    play.setColor(sf::Color::Black);
    exit_game.setColor(sf::Color::Black);
    sf::Text score_text("0", font, 20);
    score_text.setPosition(40, 20);
    score_text.setColor(sf::Color::Black);
    



    while(mainWindow.isOpen()){
        while(menu){
            sf::Event event;
            while(mainWindow.pollEvent(event)){
                if (event.type == sf::Event::Closed){
                    menu = false;
                    mainWindow.close();
                }
                if(event.type == sf::Event::Resized){
                    mainWindow.setView(sf::View(sf::FloatRect(0,0,event.size.width, event.size.height)));
                }


            }
            if(sf::Mouse::isButtonPressed(sf::Mouse::Left)){
            
                if(play.getGlobalBounds().contains(sf::Mouse::getPosition(mainWindow).x, sf::Mouse::getPosition(mainWindow).y)){
                    srand((int)time(0));
                    direction.x = rand() % 5;
                    direction.y = rand() % 5;
                    if(direction.x == 0){
                        direction.x ++;
                    }
                    if(direction.y == 0){
                        direction.y ++;
                    }
                    score = 0;
                    velocity = 1;
                    ball.setPosition(mainWindow.getSize().x/2,mainWindow.getSize().y/2);
                    menu = false;
                }
                if(exit_game.getGlobalBounds().contains(sf::Mouse::getPosition(mainWindow).x, sf::Mouse::getPosition(mainWindow).y)){
                    ball.setPosition(mainWindow.getSize().x/2,mainWindow.getSize().y/2);
                    menu = false;
                    mainWindow.close();
                }

            }
 
            mainWindow.clear(sf::Color::White);
            mainWindow.draw(play);
            mainWindow.draw(exit_game);
            mainWindow.display();  
        }
        sf::Event event;
        while(mainWindow.pollEvent(event)){
            if (event.type == sf::Event::Closed){
                menu = false;
                mainWindow.close();
            }
            if(event.type == sf::Event::Resized){
                mainWindow.setView(sf::View(sf::FloatRect(0,0,event.size.width, event.size.height)));
            }

        }
        if(GetAsyncKeyState(VK_ESCAPE)){
            menu = true;
            
        }
        if(ball.getPosition().x <= 0){
            char msgbox_text[128];
            sprintf(msgbox_text, "Your score is: %d", score);
            MessageBox(0, msgbox_text, "Score", MB_OK | MB_SYSTEMMODAL);
            menu = true;
        }
        if(ball.getPosition().y <= 0 ){
            direction.y = -direction.y;
        }
        if(ball.getPosition().y + ball.getLocalBounds().height >= mainWindow.getSize().y){
            direction.y = -direction.y;

        }
        if(ball.getPosition().x + ball.getLocalBounds().width >= mainWindow.getSize().x){
            direction.x = -direction.x;
        }
        if(ball.getGlobalBounds().intersects(paddle1.getGlobalBounds())){
            score += 10;
            direction.x = -direction.x;
        }
        if(timer == 60){
            velocity += 0.025;
            timer = 0;
        }
        char score_char[128];
        sprintf(score_char, "Score: %d", score);
        score_text.setString(score_char);
        score_text.setPosition(40,20);
        paddle1.setPosition(10, sf::Mouse::getPosition(mainWindow).y-50);
        timer ++;
        mainWindow.clear(sf::Color::White);
        ball.move(velocity*direction.x, velocity*direction.y);
        mainWindow.draw(score_text);
        mainWindow.draw(ball);
        mainWindow.draw(paddle1);
        mainWindow.display();
        
        
        
    }
    return 0;
}
