import React from 'react';
import Link from 'next/link';
import { Navbar, Nav, NavItem } from 'react-bootstrap';

const Navigation = ({ userSignedIn }: { userSignedIn: false }) => {
  return (
    <Navbar bg="light" expand="lg">
      <Navbar.Brand>
        <Link href="/categories">Food App</Link>
      </Navbar.Brand>
      <Navbar.Toggle aria-controls="navbarSupportedContent" />
      <Navbar.Collapse id="navbarSupportedContent">
        <Nav className="mr-auto">
            <>
              <NavItem>
                <Link href="/meal_carts">Cart</Link>
              </NavItem>
            </>
        </Nav>
      </Navbar.Collapse>
    </Navbar>
  );
};

export default Navigation;
