import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu> with SingleTickerProviderStateMixin {

  bool isOpen = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          
          if( isOpen) {
            _controller.reverse();
          } else {
            _controller.forward();
          }

          setState(() => isOpen = !isOpen);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 300 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: _controller),
              if( isOpen )
              ...[
                CustomMenuItem(
                  text: 'Home',
                  onPressed:() {
                    
                  },
                ),
                CustomMenuItem(
                  text: 'About',
                  onPressed:() {
                    
                  },
                ),
                CustomMenuItem(
                  text: 'Pricing',
                  onPressed:() {
                    
                  },
                ),
                CustomMenuItem(
                  text: 'Contact',
                  onPressed:() {
                    
                  },
                ),
                CustomMenuItem(
                  text: 'Location',
                  onPressed:() {
                    
                  },
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required AnimationController controller,
  }) : _controller = controller, super(key: key);

  final bool isOpen;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 40 : 0,
          ),
          Text('Menú', style: GoogleFonts.poppins( color: Colors.white, fontSize: 18 )),
          const Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}