using System;
using System.Security.Principal;
using SplashKitSDK;

namespace ShapeDrawing
{
    public class Program
    {
        
        static void Main(string[] args)
        {
            Drawing myDrawing = new Drawing();

            Window window = new Window("Shape Drawing", 800, 600);

            do
            {
                SplashKit.ProcessEvents();
                SplashKit.ClearScreen();

                if (SplashKit.MouseClicked(MouseButton.LeftButton))
                {
                    int x_cord = (int)SplashKit.MouseX();
                    int y_cord = (int)SplashKit.MouseY();
                    myDrawing.AddShape(new Shape(x_cord, y_cord));
                }

                if (SplashKit.MouseClicked(MouseButton.RightButton))
                {
                    myDrawing.SelectShapesAt(SplashKit.MousePosition());
                }

                if (SplashKit.KeyTyped(KeyCode.BackspaceKey) || SplashKit.KeyTyped(KeyCode.DeleteKey))
                {
                    myDrawing.RemoveShape();

                }

                if (SplashKit.KeyDown(KeyCode.SpaceKey))
                {
                    myDrawing.Background = Color.RandomRGB(255);
                }

                myDrawing.Draw();

                SplashKit.RefreshScreen();

            }
            while (!window.CloseRequested);

        }
    }
}